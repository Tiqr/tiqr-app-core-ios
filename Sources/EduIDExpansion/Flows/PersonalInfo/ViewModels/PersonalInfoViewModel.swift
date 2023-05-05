import UIKit
import OpenAPIClient

class PersonalInfoViewModel: NSObject {
    
    var userResponse: UserResponse?
    
    // - closures
    var dataAvailableClosure: ((PersonalInfoDataCallbackModel) -> Void)?
    var serviceRemovedClosure: ((LinkedAccount) -> Void)?
    var dataFetchErrorClosure: ((Error) -> Void)?
    private let defaults = UserDefaults.standard
    
    var viewController: CreateEduIDAddInstitutionViewController?
    
    private let keychain = KeyChainService()
    
    override init() {
        super.init()
        
        Task{
            await getData()
        }
    }
    
    @MainActor
    func getData() {
        Task {
            //TODO: Check ACCESS TOKEN CHECK
            if let accessToken = keychain.getString(for: Constants.KeyChain.accessToken) {
                do {
                    try await userResponse = UserControllerAPI.meWithRequestBuilder()
                        .addHeader(name: Constants.Headers.authorization, value: accessToken)
                        .execute()
                        .body
                    processUserData()
                } catch {
                    dataFetchErrorClosure?(error)
                }
            }
        }
    }
    
    private func processUserData() {
        guard let userResponse = userResponse else { return }
        
        if userResponse.linkedAccounts?.isEmpty ?? true {
            let name = "\(userResponse.givenName?.first ?? "X"). \(userResponse.familyName ?? "")"
            let nameProvidedBy = LocalizedKey.Profile.me.localized
            dataAvailableClosure?(PersonalInfoDataCallbackModel(userResponse: userResponse, name: name, nameProvidedBy: nameProvidedBy, isNameProvidedByInstitution: false))
        } else {
            guard let firstLinkedAccount = userResponse.linkedAccounts?.first else { return }
            
            let name = "\(firstLinkedAccount.givenName?.first ?? "X"). \(firstLinkedAccount.familyName ?? "")"
            let nameProvidedBy = firstLinkedAccount.schacHomeOrganization ?? ""
            let model = PersonalInfoDataCallbackModel(userResponse: userResponse, name: name, nameProvidedBy: nameProvidedBy, isNameProvidedByInstitution: true)
            
            dataAvailableClosure?(model)
        }
    }
    
    func removeLinkedAccount(linkedAccount: LinkedAccount) {
        Task {
            //TODO: Check ACCESS TOKEN CHECK
            if let accessToken = keychain.getString(for: Constants.KeyChain.accessToken) {
                do {
                    let result = try await UserControllerAPI.removeUserLinkedAccountsWithRequestBuilder(linkedAccount: linkedAccount)
                        .addHeader(name: Constants.Headers.authorization, value: accessToken)
                        .execute()
                        .body
                    
                    if !(result.linkedAccounts?.contains(linkedAccount) ?? true) {
                        DispatchQueue.main.async { [weak self] in
                            guard let self else { return }
                            self.serviceRemovedClosure?(linkedAccount)
                        }
                    }
                }
            }
        }
    }
}

extension PersonalInfoViewModel {
    
    @objc func createAccount() {
        guard let viewController = self.viewController else { return }
        viewController.showNextScreen()
        let biometryStatus = defaults.bool(forKey: Constants.BiometricDefaults.key)
            defaults.set(biometryStatus ? OnboardingFlowType.existingUserWithSecret.rawValue
                         : OnboardingFlowType.existingUserWithSecret.rawValue,
                         forKey: OnboardingManager.userdefaultsFlowTypeKey)
        
    }
}

struct PersonalInfoDataCallbackModel {
    var userResponse: UserResponse
    var name: String
    var nameProvidedBy: String
    var isNameProvidedByInstitution: Bool
}
