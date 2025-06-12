//
//  SettingDefinition.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct SettingDefinition: Codable {
    public let commandName: String
    public let item: String
    public let type: String?
    public let valueType: String
    public let values: [NewSettingValues]?
    public let length: Int?
    public let position: Int?
    public let commandValue: Int?
    public let valueLimits: NewValueLimits?
    public let incompatibleOptions: [NewIncompatibleObject]?
    public let orderIndex: Int?
    
    public init(commandName: String,
                item: String,
                type: String? = nil,
                valueType: String,
                values: [NewSettingValues]? = nil,
                length: Int? = nil,
                position: Int? = nil,
                commandValue: Int? = nil,
                valueLimits: NewValueLimits? = nil,
                incompatibleOptions: [NewIncompatibleObject]? = nil,
                orderIndex: Int? = nil) {
        self.commandName = commandName
        self.item = item
        self.type = type
        self.valueType = valueType
        self.values = values
        self.length = length
        self.position = position
        self.commandValue = commandValue
        self.valueLimits = valueLimits
        self.incompatibleOptions = incompatibleOptions
        self.orderIndex = orderIndex
    }
}

public struct NewSettingValues: Codable {
    public init(commandValue: Int? = nil,
                value: String? = nil,
                incompatibleSettings: [NewIncompatibleObject]? = nil,
                includedSettings: [NewIncludedSettings]? = nil,
                orderIndex: Int? = nil,
                defaultValue: Bool? = nil,
                clientAction: Bool? = nil,
                electricBar: Int? = nil) {
        self.commandValue = commandValue
        self.value = value
        self.incompatibleSettings = incompatibleSettings
        self.includedSettings = includedSettings
        self.orderIndex = orderIndex
        self.defaultValue = defaultValue
        self.clientAction = clientAction
        self.electricBar = electricBar
    }

    public let commandValue: Int?
    public let value: String?
    public let incompatibleSettings: [NewIncompatibleObject]?
    public var includedSettings: [NewIncludedSettings]?
    public let orderIndex: Int?
    public var defaultValue: Bool?
    public let clientAction: Bool?
    public let electricBar: Int?
}

public struct NewIncludedSettings: Codable {
    public let item: String
    public let values: [NewIncludedSettingsValues]?
    public let isSelectable: Bool?
    public let valueLimits: NewValueLimits?
    public let incompatibleSettings: [NewIncompatibleObject]?
    public let electricBar: Int?
    
    public init(item: String,
                values: [NewIncludedSettingsValues]? = nil,
                isSelectable: Bool? = nil,
                valueLimits: NewValueLimits? = nil,
                incompatibleSettings: [NewIncompatibleObject]? = nil,
                electricBar: Int? = nil) {
        self.item = item
        self.values = values
        self.isSelectable = isSelectable
        self.valueLimits = valueLimits
        self.incompatibleSettings = incompatibleSettings
        self.electricBar = electricBar
    }
}

public struct NewIncludedSettingsValues: Codable {
    public init(value: String? = nil,
                commandValue: Int? = nil,
                temperature: String? = nil,
                defaultValue: Bool? = nil) {
        self.value = value
        self.commandValue = commandValue
        self.temperature = temperature
        self.defaultValue = defaultValue
    }

    public let value: String?
    public let commandValue: Int?
    public let temperature: String?
    public let defaultValue: Bool?
}
