//
// IdentityProvider.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct IdentityProvider: Codable, JSONEncodable, Hashable {

    public var displayNameEn: String?
    public var displayNameNl: String?

    public init(displayNameEn: String? = nil, displayNameNl: String? = nil) {
        self.displayNameEn = displayNameEn
        self.displayNameNl = displayNameNl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayNameEn
        case displayNameNl
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(displayNameEn, forKey: .displayNameEn)
        try container.encodeIfPresent(displayNameNl, forKey: .displayNameNl)
    }
}

