//
// CreateUserResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateUserResponse: Codable, Hashable {

    public var user: User
    public var authInfo: AuthInfo

    public init(user: User, authInfo: AuthInfo) {
        self.user = user
        self.authInfo = authInfo
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case user
        case authInfo = "auth_info"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(user, forKey: .user)
        try container.encode(authInfo, forKey: .authInfo)
    }
}
