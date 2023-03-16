//
// AccountLinkerControllerAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AccountLinkerControllerAPI {

    /**
     Start link account flow
     
     - returns: Void
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func startSPLinkAccountFlow() async throws {
        return try await startSPLinkAccountFlowWithRequestBuilder().execute().body
    }

    /**
     Start link account flow
     - GET /mobile/api/sp/oidc/link
     - Start the link account flow for the current user
     - returns: RequestBuilder<Void> 
     */
    open class func startSPLinkAccountFlowWithRequestBuilder() -> RequestBuilder<Void> {
        let localVariablePath = "/mobile/api/sp/oidc/link"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = OpenAPIClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
