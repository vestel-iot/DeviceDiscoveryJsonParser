//
//  CommandDefinition.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct CommandDefinition: Codable {
    let commandName: String
    let item: String
    let commandValue: Int?
    let value: String?
    let valueType: String?
}
