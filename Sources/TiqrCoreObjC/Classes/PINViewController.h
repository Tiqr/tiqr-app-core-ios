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

#import <UIKit/UIKit.h>
#import "BaseViewControllerWithNavigationbarAppearance.h"

/**
 * Base class for entering a PIN. Shows an icon for the entered digits
 * which the user can use to recognize if he/she entered the correct PIN.
 */
@class PINViewController;

@protocol PINViewControllerDelegate <NSObject>

@required
- (void)PINViewController:(PINViewController *)viewController didFinishWithPIN:(NSString *)PIN;

@end

@interface PINViewController : BaseViewControllerWithNavigationbarAppearance <UITextFieldDelegate> {
    
}

/**
 * Delegate.
 */
@property (nonatomic, weak) id<PINViewControllerDelegate> delegate;

/**
 * Title.
 */
@property (nonatomic, copy) NSString *subtitle;

/**
 * Description for the user.
 */
@property (nonatomic, copy) NSString *pinDescription;

/**
 * Additional notes for the user.
 */
@property (nonatomic, copy) NSString *pinNotes;

/**
 * Shows the user an error with the given title and message.
 *
 * @param string  error title
 * @param message error message
 */
- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message;

/**
 * Clear the PIN fields and focus on the first digit.
 */
- (void)clear;

@end
