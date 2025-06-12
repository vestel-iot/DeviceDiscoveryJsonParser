//
//  StatusDefinition.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct StatusDefinition: Codable {
    public let commandName: String
    public let item: String
    public let valueType: String
    public let values: [StatusValue]?
    public let position: Int?
    public let length: Int?
    public let valueLimits: NewValueLimits?
}

public struct StatusValue: Codable {
    public let commandValue: Int
    public let value: String
}
