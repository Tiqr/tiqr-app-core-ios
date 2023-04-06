//
// UserControllerAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class UserControllerAPI {

    /**
     Confirm email change
     
     - parameter h: (query) The hash obtained from the query parameter &#39;h&#39; in the URL sent to the user in the update-email 
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func confirmUpdateEmail(h: String) async throws -> UserResponse {
        return try await confirmUpdateEmailWithRequestBuilder(h: h).execute().body
    }

    /**
     Confirm email change
     - GET /mobile/api/sp/confirm-email
     - Confirm the user has clicked on the link in the email sent after requesting to change the users email<br/>A confirmation email is sent to notify the user of the security change with a link to the security settings <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/security</a>. <br/>If this URL is not properly intercepted by the eduID app, then the browser app redirects to <a href=\"\">eduid://client/mobile/security</a>
     - parameter h: (query) The hash obtained from the query parameter &#39;h&#39; in the URL sent to the user in the update-email 
     - returns: RequestBuilder<UserResponse> 
     */
    open class func confirmUpdateEmailWithRequestBuilder(h: String) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/confirm-email"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "h": (wrappedValue: h.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Create eduID account
     
     - parameter createAccount: (body)  
     - returns: StatusResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func createEduIDAccount(createAccount: CreateAccount) async throws -> StatusResponse {
        return try await createEduIDAccountWithRequestBuilder(createAccount: createAccount).execute().body
    }

    /**
     Create eduID account
     - POST /mobile/api/idp/create
     - Create an eduID account and sent a verification mail to the user to confirm the ownership of the email. <br/>Link in the validation email is <a href=\"\">https://login.{environment}.eduid.nl/mobile/api/create-from-mobile-api?h=={{hash}}</a> whichmust NOT be captured by the eduID app.<br/>After the account is finalized server-side the user is logged in and the server redirects to <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/created</a><br/>If the URL is not properly intercepted by the eduID app, then the browser app redirects to <a href=\"\">eduid://client/mobile/created?new=true</a>
     - parameter createAccount: (body)  
     - returns: RequestBuilder<StatusResponse> 
     */
    open class func createEduIDAccountWithRequestBuilder(createAccount: CreateAccount) -> RequestBuilder<StatusResponse> {
        let localVariablePath = "/mobile/api/idp/create"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createAccount)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<StatusResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Delete
     
     - returns: StatusResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func deleteUser() async throws -> StatusResponse {
        return try await deleteUserWithRequestBuilder().execute().body
    }

    /**
     Delete
     - DELETE /mobile/api/sp/delete
     - Delete the current logged in user
     - returns: RequestBuilder<StatusResponse> 
     */
    open class func deleteUserWithRequestBuilder() -> RequestBuilder<StatusResponse> {
        let localVariablePath = "/mobile/api/sp/delete"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<StatusResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Forget me
     
     - returns: Int64
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func forgetMe() async throws -> Int64 {
        return try await forgetMeWithRequestBuilder().execute().body
    }

    /**
     Forget me
     - DELETE /mobile/api/sp/forget
     - Delete the long remember-me login for the current user
     - returns: RequestBuilder<Int64> 
     */
    open class func forgetMeWithRequestBuilder() -> RequestBuilder<Int64> {
        let localVariablePath = "/mobile/api/sp/forget"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Int64>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Institution displaynames
     
     - parameter schacHome: (query)  
     - returns: IdentityProvider
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func institutionNames(schacHome: String) async throws -> IdentityProvider {
        return try await institutionNamesWithRequestBuilder(schacHome: schacHome).execute().body
    }

    /**
     Institution displaynames
     - GET /mobile/api/sp/institution/names
     - Retrieve the displayNames of the Institution by the schac_home value
     - parameter schacHome: (query)  
     - returns: RequestBuilder<IdentityProvider> 
     */
    open class func institutionNamesWithRequestBuilder(schacHome: String) -> RequestBuilder<IdentityProvider> {
        let localVariablePath = "/mobile/api/sp/institution/names"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "schac_home": (wrappedValue: schacHome.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<IdentityProvider>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     All institutional domains
     
     - returns: Set<String>
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func institutionalDomains() async throws -> Set<String> {
        return try await institutionalDomainsWithRequestBuilder().execute().body
    }

    /**
     All institutional domains
     - GET /mobile/api/sp/create-from-institution/domain/institutional
     - All institutional domains which will generate a warning if a user enters an email at this domain
     - returns: RequestBuilder<Set<String>> 
     */
    open class func institutionalDomainsWithRequestBuilder() -> RequestBuilder<Set<String>> {
        let localVariablePath = "/mobile/api/sp/create-from-institution/domain/institutional"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Set<String>>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     All institutional domains
     
     - returns: Set<String>
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func institutionalDomains1() async throws -> Set<String> {
        return try await institutionalDomains1WithRequestBuilder().execute().body
    }

    /**
     All institutional domains
     - GET /mobile/api/idp/email/domain/institutional
     - All institutional domains which will generate a warning if a user enters an email at this domain
     - returns: RequestBuilder<Set<String>> 
     */
    open class func institutionalDomains1WithRequestBuilder() -> RequestBuilder<Set<String>> {
        let localVariablePath = "/mobile/api/idp/email/domain/institutional"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Set<String>>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Logout
     
     - returns: StatusResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func logout() async throws -> StatusResponse {
        return try await logoutWithRequestBuilder().execute().body
    }

    /**
     Logout
     - GET /mobile/api/sp/logout
     - Logout the current logged in user
     - returns: RequestBuilder<StatusResponse> 
     */
    open class func logoutWithRequestBuilder() -> RequestBuilder<StatusResponse> {
        let localVariablePath = "/mobile/api/sp/logout"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<StatusResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     User details
     
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func me() async throws -> UserResponse {
        return try await meWithRequestBuilder().execute().body
    }

    /**
     User details
     - GET /mobile/api/sp/me
     - Retrieve the attributes of the current user
     - returns: RequestBuilder<UserResponse> 
     */
    open class func meWithRequestBuilder() -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/me"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get all outstanding change-emails-requests
     
     - returns: Bool
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func outstandingEmailLinks() async throws -> Bool {
        return try await outstandingEmailLinksWithRequestBuilder().execute().body
    }

    /**
     Get all outstanding change-emails-requests
     - GET /mobile/api/sp/outstanding-email-links
     - Get all outstanding change-emails-requests for the logged in user
     - returns: RequestBuilder<Bool> 
     */
    open class func outstandingEmailLinksWithRequestBuilder() -> RequestBuilder<Bool> {
        let localVariablePath = "/mobile/api/sp/outstanding-email-links"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Bool>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get personal data
     
     - returns: User
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func personal() async throws -> User {
        return try await personalWithRequestBuilder().execute().body
    }

    /**
     Get personal data
     - GET /mobile/api/sp/personal
     - Get personal data for download
     - returns: RequestBuilder<User> 
     */
    open class func personalWithRequestBuilder() -> RequestBuilder<User> {
        let localVariablePath = "/mobile/api/sp/personal"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<User>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Remove user tokens
     
     - parameter deleteServiceTokens: (body)  
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func removeTokens(deleteServiceTokens: DeleteServiceTokens) async throws -> UserResponse {
        return try await removeTokensWithRequestBuilder(deleteServiceTokens: deleteServiceTokens).execute().body
    }

    /**
     Remove user tokens
     - PUT /mobile/api/sp/tokens
     - Remove user token for a service
     - parameter deleteServiceTokens: (body)  
     - returns: RequestBuilder<UserResponse> 
     */
    open class func removeTokensWithRequestBuilder(deleteServiceTokens: DeleteServiceTokens) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/tokens"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: deleteServiceTokens)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Remove linked account
     
     - parameter linkedAccount: (body)  
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func removeUserLinkedAccounts(linkedAccount: LinkedAccount) async throws -> UserResponse {
        return try await removeUserLinkedAccountsWithRequestBuilder(linkedAccount: linkedAccount).execute().body
    }

    /**
     Remove linked account
     - PUT /mobile/api/sp/institution
     - Remove linked account for a logged in user
     - parameter linkedAccount: (body)  
     - returns: RequestBuilder<UserResponse> 
     */
    open class func removeUserLinkedAccountsWithRequestBuilder(linkedAccount: LinkedAccount) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/institution"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: linkedAccount)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Remove user service
     
     - parameter deleteServiceTokens: (body)  
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func removeUserService(deleteServiceTokens: DeleteServiceTokens) async throws -> UserResponse {
        return try await removeUserServiceWithRequestBuilder(deleteServiceTokens: deleteServiceTokens).execute().body
    }

    /**
     Remove user service
     - PUT /mobile/api/sp/service
     - Remove user service
     - parameter deleteServiceTokens: (body)  
     - returns: RequestBuilder<UserResponse> 
     */
    open class func removeUserServiceWithRequestBuilder(deleteServiceTokens: DeleteServiceTokens) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/service"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: deleteServiceTokens)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Validate password hash
     
     - parameter hash: (query)  
     - returns: Bool
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func resetPasswordHashValid(hash: String) async throws -> Bool {
        return try await resetPasswordHashValidWithRequestBuilder(hash: hash).execute().body
    }

    /**
     Validate password hash
     - GET /mobile/api/sp/password-reset-hash-valid
     - Check if a password change hash is valid and not expired
     - parameter hash: (query)  
     - returns: RequestBuilder<Bool> 
     */
    open class func resetPasswordHashValidWithRequestBuilder(hash: String) -> RequestBuilder<Bool> {
        let localVariablePath = "/mobile/api/sp/password-reset-hash-valid"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "hash": (wrappedValue: hash.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Bool>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Reset password link
     
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func resetPasswordLink() async throws -> UserResponse {
        return try await resetPasswordLinkWithRequestBuilder().execute().body
    }

    /**
     Reset password link
     - PUT /mobile/api/sp/reset-password-link
     - Sent the user a mail with a link for the user to change his / hers password. <br/>Link in the validation email is <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/reset-password?h=={{hash}}</a> if the user already had a password, otherwise <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/add-password?h=={{hash}}</a><br/>If the URL is not properly intercepted by the eduID app, then the browser app redirects to <a href=\"\">eduid://client/mobile/reset-password?h={{hash}}</a>
     - returns: RequestBuilder<UserResponse> 
     */
    open class func resetPasswordLinkWithRequestBuilder() -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/reset-password-link"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get all OpenID Connect tokens
     
     - returns: [Token]
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func tokens() async throws -> [Token] {
        return try await tokensWithRequestBuilder().execute().body
    }

    /**
     Get all OpenID Connect tokens
     - GET /mobile/api/sp/tokens
     - Get all OpenID Connect tokens for the logged in user
     - returns: RequestBuilder<[Token]> 
     */
    open class func tokensWithRequestBuilder() -> RequestBuilder<[Token]> {
        let localVariablePath = "/mobile/api/sp/tokens"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Token]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Change email
     
     - parameter updateEmailRequest: (body)  
     - parameter force: (query)  (optional, default to false)
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func updateEmail(updateEmailRequest: UpdateEmailRequest, force: Bool? = nil) async throws -> UserResponse {
        return try await updateEmailWithRequestBuilder(updateEmailRequest: updateEmailRequest, force: force).execute().body
    }

    /**
     Change email
     - PUT /mobile/api/sp/email
     - Request to change the email of the user. The link in the validation email is <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/update-email?h=={{hash}}</a>with an unique 'h' query param which must be used in 'mobile/api/sp/confirm-email' to confirm the update.<br/>If the URL is not properly intercepted by the eduID app, then the browser app redirects to <a href=\"\">eduid://client/mobile/confirm-email?h={{hash}}</a>
     - parameter updateEmailRequest: (body)  
     - parameter force: (query)  (optional, default to false)
     - returns: RequestBuilder<UserResponse> 
     */
    open class func updateEmailWithRequestBuilder(updateEmailRequest: UpdateEmailRequest, force: Bool? = nil) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/email"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateEmailRequest)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "force": (wrappedValue: force?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Update password
     
     - parameter updateUserSecurityRequest: (body)  
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func updateUserPassword(updateUserSecurityRequest: UpdateUserSecurityRequest) async throws -> UserResponse {
        return try await updateUserPasswordWithRequestBuilder(updateUserSecurityRequest: updateUserSecurityRequest).execute().body
    }

    /**
     Update password
     - PUT /mobile/api/sp/update-password
     - Update or delete the user's password using the hash from the 'h' query param in the validation email. If 'newPassword' is null / empty than the password is removed.
     - parameter updateUserSecurityRequest: (body)  
     - returns: RequestBuilder<UserResponse> 
     */
    open class func updateUserPasswordWithRequestBuilder(updateUserSecurityRequest: UpdateUserSecurityRequest) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/update-password"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateUserSecurityRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Change names
     
     - parameter updateUserNameRequest: (body)  
     - returns: UserResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func updateUserProfile(updateUserNameRequest: UpdateUserNameRequest) async throws -> UserResponse {
        return try await updateUserProfileWithRequestBuilder(updateUserNameRequest: updateUserNameRequest).execute().body
    }

    /**
     Change names
     - PUT /mobile/api/sp/update
     - Update the givenName and / or familyName of the User
     - parameter updateUserNameRequest: (body)  
     - returns: RequestBuilder<UserResponse> 
     */
    open class func updateUserProfileWithRequestBuilder(updateUserNameRequest: UpdateUserNameRequest) -> RequestBuilder<UserResponse> {
        let localVariablePath = "/mobile/api/sp/update"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateUserNameRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<UserResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}