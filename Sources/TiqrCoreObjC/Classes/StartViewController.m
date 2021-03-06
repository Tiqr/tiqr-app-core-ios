/*
 * Copyright (c) 2010-2011 SURFnet bv
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of SURFnet bv nor the names of its contributors 
 *    may be used to endorse or promote products derived from this 
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "StartViewController.h"
#import "ScanViewController.h"
#import "IdentityListViewController.h"
#import "ErrorController.h"
#import "AboutViewController.h"
#import "ServiceContainer.h"
#import <UIKit/UIKit.h>
#import "TiqrConfig.h"
@import TiqrCore;

@interface StartViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *identitiesButtonItem;
@property (nonatomic, strong) ErrorController *errorController;
@property (nonatomic, strong) IBOutlet UIButton *scanButton;
@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    NSString *scanButtonTitle = [Localization localize:@"scan_button" comment:@"Scan button title"];
    [self.scanButton setTitle:scanButtonTitle forState:UIControlStateNormal];
    self.scanButton.layer.cornerRadius = 5;
    self.scanButton.backgroundColor = [ThemeService shared].theme.buttonBackgroundColor;
    [self.scanButton.titleLabel setFont:[ThemeService shared].theme.buttonFont];
    [self.scanButton setTitleColor:[ThemeService shared].theme.buttonTintColor forState:UIControlStateNormal];
    [self.scanButton setTintColor:[ThemeService shared].theme.buttonTintColor];

    UIImage *image = [UIImage imageNamed:@"identities-icon" inBundle:SWIFTPM_MODULE_BUNDLE compatibleWithTraitCollection:nil];
    UIBarButtonItem *identitiesButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(listIdentities)];
    self.navigationItem.rightBarButtonItem = identitiesButtonItem;
    self.identitiesButtonItem = identitiesButtonItem;
    
    self.errorController = [[ErrorController alloc] init];  
    [self.errorController addToView:self.view];
    
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;       
    self.webView.delegate = self;
    self.webView.scrollView.bounces = NO;
    
    UIImage *infoImage = [UIImage imageNamed:@"info-icon" inBundle:SWIFTPM_MODULE_BUNDLE compatibleWithTraitCollection:nil];
    [self setToolbarItems:@[[[UIBarButtonItem alloc] initWithImage:infoImage style:UIBarButtonItemStylePlain target:self action:@selector(about)]] animated:NO];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.errorController.view.hidden = YES;
    self.webView.frame = CGRectMake(0.0, 0.0, self.webView.frame.size.width, self.view.frame.size.height);
    
    NSString *content = @"";
    if (ServiceContainer.sharedInstance.identityService.allIdentitiesBlocked) {
        self.webView.frame = CGRectMake(0.0, self.errorController.view.frame.size.height, self.webView.frame.size.width, self.view.frame.size.height - self.errorController.view.frame.size.height);
        self.errorController.view.hidden = NO;
        self.navigationItem.rightBarButtonItem = self.identitiesButtonItem;
        self.errorController.title = [Localization localize:@"error_auth_account_blocked_title" comment:@"Accounts blocked error title"];
        self.errorController.message = [Localization localize:@"to_many_attempts" comment:@"Accounts blocked error message"];
        content = [Localization localize:@"main_text_blocked" comment:nil];
    } else if (ServiceContainer.sharedInstance.identityService.identityCount > 0) {
        self.navigationItem.rightBarButtonItem = self.identitiesButtonItem;
        content = [NSString stringWithFormat:[Localization localize:@"main_text_instructions" comment:nil], TiqrConfig.appName, TiqrConfig.appName];
    } else {
        self.navigationItem.rightBarButtonItem = nil;
        
        NSString *string = [Localization localize:@"main_text_welcome" comment:@"main_text_welcome"];
        content = [NSString stringWithFormat:[Localization localize:@"main_text_welcome" comment:nil], TiqrConfig.appName, TiqrConfig.appName];
    }

    NSString *path = [SWIFTPM_MODULE_BUNDLE pathForResource:@"start" ofType:@"html"];
    NSURL *URL = [NSURL fileURLWithPath:path];

    NSString *html = [NSString stringWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:nil];
    
    UIFont *font= [ThemeService shared].theme.bodyFont;
    UIFont *boldFont= [ThemeService shared].theme.bodyBoldFont;
    NSString *fontName = @"";
    NSString *boldFontName = @"";

    if (![font.fontName hasPrefix:@"."]) {
        fontName = font.fontName;
    }

    if (![boldFont.fontName hasPrefix:@"."]) {
        boldFontName = boldFont.fontName;
    }

    html = [NSString stringWithFormat:html, @(font.pointSize), fontName, @(boldFont.pointSize), boldFontName, content];
    [self.webView loadHTMLString:html baseURL:nil];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if (navigationType == UIWebViewNavigationTypeLinkClicked) {
		[[UIApplication sharedApplication] openURL:[request URL]];
		return NO;
	} else {
		return YES;
	}
}

- (IBAction)scan {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];	
    if (ServiceContainer.sharedInstance.identityService.identityCount > 0 &&
        [defaults objectForKey:@"show_instructions_preference"] == nil) {
		NSString *message = [Localization localize:@"show_instructions_preference_message" comment:@"Do you want to see these instructions when you start the application in the future? You can always open the instructions from the Scan window or change this behavior in Settings."];
		NSString *yesTitle = [Localization localize:@"yes_button" comment:@"Yes button title"];
		NSString *noTitle = [Localization localize:@"no_button" comment:@"No button title"];

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yesButton = [UIAlertAction actionWithTitle:yesTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:YES forKey:@"show_instructions_preference"];

            ScanViewController *viewController = [[ScanViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
        }];

        UIAlertAction *noButton = [UIAlertAction actionWithTitle:noTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:NO forKey:@"show_instructions_preference"];

            ScanViewController *viewController = [[ScanViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
        }];

        [alertController addAction:yesButton];
        [alertController addAction:noButton];

        [self presentViewController:alertController animated:YES completion:nil];
	} else {
		ScanViewController *viewController = [[ScanViewController alloc] init];
		[self.navigationController pushViewController:viewController animated:YES];	
	}
}

- (void)about {
    UIViewController *viewController = [[AboutViewController alloc] init];
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

- (void)listIdentities {
    IdentityListViewController *viewController = [[IdentityListViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
