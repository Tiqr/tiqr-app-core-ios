//
// UpdateUserSecurityRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateUserSecurityRequest: Codable, JSONEncodable, Hashable {

    public var newPassword: String
    public var hash: String?

    public init(newPassword: String, hash: String? = nil) {
        self.newPassword = newPassword
        self.hash = hash
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case newPassword
        case hash
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(newPassword, forKey: .newPassword)
        try container.encodeIfPresent(hash, forKey: .hash)
    }
}
