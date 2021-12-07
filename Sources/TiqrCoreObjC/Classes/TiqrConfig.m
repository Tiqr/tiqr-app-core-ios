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

#import "TiqrConfig.h"

@interface TiqrConfig()

@end

@implementation TiqrConfig

+ (NSString *)valueForKey:(NSString *)string {
    NSString *path = [SWIFTPM_MODULE_BUNDLE pathForResource:@"Config" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *value = [dictionary objectForKey:string];
    
    return value;
}

+ (BOOL)isValidAuthenticationScheme:(NSString *)scheme {
    NSString *authenticationKey = @"TIQRAuthenticationURLScheme";
    NSString *coreScheme = [TiqrConfig valueForKey:authenticationKey];
    NSString *appScheme = [[[NSBundle mainBundle] infoDictionary] objectForKey:authenticationKey];

    return ([scheme isEqualToString:coreScheme] || (appScheme && [appScheme isEqualToString:coreScheme]));
}

+ (BOOL)isValidEnrollmentScheme:(NSString *)scheme {
    NSString *enrollmentKey = @"TIQREnrollmentURLScheme";
    NSString *coreScheme = [TiqrConfig valueForKey:enrollmentKey];
    NSString *appScheme = [[[NSBundle mainBundle] infoDictionary] objectForKey:enrollmentKey];

    return ([scheme isEqualToString:coreScheme] || (appScheme && [appScheme isEqualToString:coreScheme]));
}

+ (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
