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

import UIKit
import TiqrCore
import TiqrCoreObjC

@objc
public final class Tiqr: NSObject {
    public static let shared = Tiqr()
    private let tiqrCoreManager = TiqrCoreManager()

    private override init() {
        super.init()

        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForegroundNotification), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackgroundNotification), name: UIApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willTerminateNotification), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
    }
}

private extension Tiqr {

    @objc func willEnterForegroundNotification() {
        TiqrCoreManager.sharedInstance().popToRootViewController(animated: true)
    }

    @objc func didEnterBackgroundNotification() {
        ServiceContainer.sharedInstance().identityService.saveIdentities()
    }

    @objc func willTerminateNotification() {
        ServiceContainer.sharedInstance().identityService.saveIdentities()
    }
}

public extension Tiqr {
    @available(iOS 13.0, *)
    func startWithOptions(options: UIScene.ConnectionOptions, theme: TiqrThemeType?) -> UINavigationController {
        let userInfo = options.notificationResponse?.notification.request.content.userInfo

        if let theme = theme {
            ThemeService.shared.theme = theme
        }
        return TiqrCoreManager.sharedInstance().start(options: userInfo)
    }

    func startWithOptions(options: [UIApplication.LaunchOptionsKey: Any]?, theme: TiqrThemeType?) -> UINavigationController {
        if let theme = theme {
            ThemeService.shared.theme = theme
        }
        return TiqrCoreManager.sharedInstance().start(options: options)
    }

    func registerDeviceToken(token: Data) {
        NotificationRegistration.sharedInstance().sendRequest(withDeviceToken: token)
    }

    func startChallenge(challenge: String) {
        TiqrCoreManager.sharedInstance().startChallenge(challenge)
    }
}

