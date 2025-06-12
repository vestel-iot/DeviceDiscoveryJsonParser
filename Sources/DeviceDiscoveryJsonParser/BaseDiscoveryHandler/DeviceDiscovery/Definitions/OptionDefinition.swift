//
//  OptionDefinition.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct OptionDefinition: Codable {
    public let commandName: String
    public let item: String
    public let commandValue: Int?
    public let orderIndex: Int?
    public let electricBar: Int?
    public let waterBar: Int?
    public let ecoMode: Bool?
    public let value: String?
    public let values: [OptionValue]?
    public let position: Int?
    public let length: Int?
    public let supportedStates: [NewSupportedState]?
    public let supportedPhases: [NewSupportedPhase]?
    public let valueLimits: NewValueLimits?
    public let incompatibleOptions: [NewIncompatibleObject]?
}

public struct NewSupportedState: Codable {
    public let value: String
    public let item: String
}

public struct NewSupportedPhase: Codable {
    public let value: String
    public let item: String
}

//TODO: -JSON- eski yapida including settings var? gercekten kullaniliyor mu kontrol et
public struct OptionValue: Codable {
    public let commandValue: Int
    public let value: String
}

public struct NewIncompatibleObject: Codable {
    public let value: String
}
