import Foundation
import TiqrCoreObjC

public class OnboardingManager: NSObject {
    
    //MARK: - singleton instance
    public static var shared = OnboardingManager()
    private let defaults = UserDefaults.standard
    
    static var userdefaultsFlowTypeKey = "userdefaultsFlowTypeKey"
    
    //MARK: - private init()
    private override init() {
        super.init()
    }
    
    //MARK: - query
    public func getAppropriateLaunchOption() -> OnboardingFlowType {
        if let onboardingFlowTypeString = UserDefaults.standard.value(forKey: OnboardingManager.userdefaultsFlowTypeKey) as? String, let onboardingFlowType = OnboardingFlowType(rawValue: onboardingFlowTypeString) {
            return onboardingFlowType
        } else {
            //TODO: find out how to know if there's a secret without biometric data
            return .newUser
        }
    }
}

public enum OnboardingFlowType: String {
    case newUser
    case existingUserWithSecret
    case existingUserWithoutSecret
    case mfaOnly
    case onboard
}


