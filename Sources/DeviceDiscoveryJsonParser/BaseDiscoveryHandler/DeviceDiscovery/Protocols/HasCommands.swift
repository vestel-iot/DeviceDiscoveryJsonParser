//
//  HasCommands.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public protocol HasCommands {
    var commands: [CommandDefinition] { get }
}
