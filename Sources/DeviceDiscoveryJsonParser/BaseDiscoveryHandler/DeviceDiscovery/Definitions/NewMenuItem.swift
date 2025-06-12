//
//  NewMenuItem.swift.swift
//  DeviceDiscoveryJsonParser
//
//  Created by Alperen on 12.06.2025.
//

import Foundation

public struct NewMenuItem: Codable {
    public let isExist: Bool
    public let values: [OptionValue]?
    public let valueLimits: NewValueLimits?
    public let supportedStates: [NewSupportedState]?
    public let supportedPhases: [NewSupportedPhase]?
    public let optionRelationsForItem: [NewRelationship]
    public let incompatibleOptions: [NewIncompatibleObject]?
    public let position: Int?
    public let length: Int?
    public let commandName: String?

    public init(isExist: Bool, values: [OptionValue]?) {
        self.isExist = isExist
        self.values = values
        self.valueLimits = nil
        self.supportedStates = nil
        self.supportedPhases = nil
        self.optionRelationsForItem = []
        self.incompatibleOptions = nil
        self.position = nil
        self.length = nil
        self.commandName = nil
    }
    public init(
        isExist: Bool, values: [OptionValue]?, valueLimits: NewValueLimits?,
        supportedStates: [NewSupportedState]?
    ) {
        self.isExist = isExist
        self.values = values
        self.valueLimits = valueLimits
        self.supportedStates = supportedStates
        self.supportedPhases = nil
        self.optionRelationsForItem = []
        self.incompatibleOptions = nil
        self.position = nil
        self.length = nil
        self.commandName = nil
    }
    public init(isExist: Bool, values: [OptionValue]?, valueLimits: NewValueLimits?, supportedStates: [NewSupportedState]?, supportedPhases: [NewSupportedPhase]?) {
        self.isExist = isExist
        self.values = values
        self.valueLimits = valueLimits
        self.supportedStates = supportedStates
        self.supportedPhases = supportedPhases
        self.optionRelationsForItem = []
        self.incompatibleOptions = nil
        self.position = nil
        self.length = nil
        self.commandName = nil
    }
    public init(isExist: Bool, values: [OptionValue]?, valueLimits: NewValueLimits?, supportedStates: [NewSupportedState]?, incompatibleOptions: [NewIncompatibleObject]?) {
        self.isExist = isExist
        self.values = values
        self.valueLimits = valueLimits
        self.supportedStates = supportedStates
        self.supportedPhases = nil
        self.optionRelationsForItem = []
        self.incompatibleOptions = incompatibleOptions
        self.position = nil
        self.length = nil
        self.commandName = nil
    }
    public init(
        isExist: Bool, values: [OptionValue]?, valueLimits: NewValueLimits?,
        supportedStates: [NewSupportedState]?, supportedPhases: [NewSupportedPhase]?,
        optionRelationsForItem: [NewRelationship], position: Int?, length: Int?, commandName: String?
    ) {
        self.isExist = isExist
        self.values = values
        self.valueLimits = valueLimits
        self.supportedStates = supportedStates
        self.supportedPhases = supportedPhases
        self.optionRelationsForItem = optionRelationsForItem
        self.incompatibleOptions = nil
        self.position = position
        self.length = length
        self.commandName = commandName
    }
}
