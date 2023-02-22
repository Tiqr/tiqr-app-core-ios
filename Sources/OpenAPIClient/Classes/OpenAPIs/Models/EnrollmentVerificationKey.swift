//
// EnrollmentVerificationKey.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EnrollmentVerificationKey: Codable, JSONEncodable, Hashable {

    public var enrollmentVerificationKey: String?

    public init(enrollmentVerificationKey: String? = nil) {
        self.enrollmentVerificationKey = enrollmentVerificationKey
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case enrollmentVerificationKey
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enrollmentVerificationKey, forKey: .enrollmentVerificationKey)
    }
}

