//
//  SettingDiscoveryHandler.swift
//  UmbrellaApp
//
//  Created by Alperen on 28.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

public protocol SettingDiscoveryHandler: BaseDiscoveryHandler {}

extension SettingDiscoveryHandler where GenericDeviceData: SettingsDeviceData {
    func fillDeviceSettings(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [String: SettingDefinition] {
        var settings: [String: SettingDefinition] = [:]
        for setting in json.data.settings {
            settings[setting.item] = SettingDefinition(commandName: setting.commandName,
                                                       item: setting.item,
                                                       type: setting.type,
                                                       valueType: setting.valueType,
                                                       values: setting.values,
                                                       length: setting.length,
                                                       position: setting.position,
                                                       commandValue: setting.commandValue,
                                                       valueLimits: setting.valueLimits,
                                                       incompatibleOptions: setting.incompatibleOptions,
                                                       orderIndex: setting.orderIndex)
        }
        
        return settings
    }
        
    func fillSettingRelations(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [String: [NewObjectRelation]] {
        let relations = json.data.settingRelations.map { data in
            NewObjectRelation(value: data?.item ?? "", relations: data?.relations ?? [])
        }
        let grouped = Dictionary(grouping: relations, by: { $0.value })
        
        return grouped
    }
}
