//
//  ErrorDefinition.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct ErrorDefinition: Codable {
    let commandName: String
    let item: String
    let valueType: String
    let values: [ErrorValue]?
    let position: Int?
    let length: Int?
    let valueLimits: NewValueLimits?
}

public struct ErrorValue: Codable {
    let commandValue: Int
    let value: String
}
