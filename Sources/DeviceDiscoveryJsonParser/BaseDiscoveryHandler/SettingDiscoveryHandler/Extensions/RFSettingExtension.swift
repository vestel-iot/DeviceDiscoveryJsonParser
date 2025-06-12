//
//  RFSettingExtension.swift
//  UmbrellaApp
//
//  Created by Alperen on 30.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

extension SettingDiscoveryHandler where GenericDeviceData: IRFDeviceData {
    func commonMappedData(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> (
        mainModel: String,
        status: [StatusDefinition],
        settings: [String: SettingDefinition],
        settingRelations: [String: [NewObjectRelation]],
        setting: NewRefrigeratorData.SettingData?,
        errors: [ErrorDefinition],
        feature: String
    ) {
        return (
            mainModel: fillDeviceModel(json: json),
            status: fillOptionDataStatus(json: json),
            settings: fillDeviceSettings(json: json),
            settingRelations: [:],
            setting: fillSettingsValue(json: json),
            errors: fillErrors(json: json),
            feature: fillDeviceFeature(json: json))
    }
    
    private func fillSettingsValue(json: NewDeviceDiscoveryResult<GenericDeviceData>
    ) -> NewRefrigeratorData.SettingData {
        var modes: [NewSettingValues] = []
        
        for data in json.data.settings {
            switch RefrigeratorRFSettings(rawValue: data.item) {
            case .mode:
                modes = data.values ?? []
            default: break
            }
        }
        
        return NewRefrigeratorData.SettingData(
            modes: getModes(modes: modes),
            refrigeratorDict: [:],
            mainMode: nil)
    }
    
    private func getModes(modes: [NewSettingValues]) -> [NewSettingValues] {
        var updatedModes: [NewSettingValues] = []
        for type in modes {
            switch RefrigeratorRFSettingMode(rawValue: type.value ?? "") {
            case .normal:
                var includedSettings: [NewIncludedSettings] = []
                for temp in type.includedSettings ?? [] {
                    var values: [NewIncludedSettingsValues] = []
                    switch RefrigeratorRFSettings(rawValue: temp.item) {
                    case .cooler:
                        for tempValue in temp.values ?? [] {
                            values.append(
                                NewIncludedSettingsValues(
                                    value: tempValue.value,
                                    commandValue: tempValue.commandValue,
                                    defaultValue: tempValue.defaultValue))
                        }
                        includedSettings.append(NewIncludedSettings(item: temp.item, values: values))
                    case .freezer:
                        for tempValue in temp.values ?? [] {
                            values.append(
                                NewIncludedSettingsValues(
                                    value: tempValue.value,
                                    commandValue: tempValue.commandValue,
                                    defaultValue: tempValue.defaultValue))
                        }
                        includedSettings.append(NewIncludedSettings(item: temp.item, values: values))
                        
                    default: break
                    }
                }
                updatedModes.append(
                    NewSettingValues(
                        commandValue: type.commandValue,
                        value: type.value,
                        includedSettings: includedSettings,
                        orderIndex: type.orderIndex,
                        electricBar: type.electricBar))
            case .eco:
                updatedModes.append(
                    NewSettingValues(
                        commandValue: type.commandValue,
                        value: type.value,
                        orderIndex: type.orderIndex,
                        electricBar: type.electricBar))
            case .holiday:
                updatedModes.append(
                    NewSettingValues(
                        commandValue: type.commandValue,
                        value: type.value,
                        orderIndex: type.orderIndex,
                        electricBar: type.electricBar))
            case .superCooler:
                updatedModes.append(
                    NewSettingValues(
                        commandValue: type.commandValue,
                        value: type.value,
                        orderIndex: type.orderIndex,
                        electricBar: type.electricBar))
            case .superFreeze:
                updatedModes.append(
                    NewSettingValues(
                        commandValue: type.commandValue,
                        value: type.value,
                        orderIndex: type.orderIndex,
                        electricBar: type.electricBar))
            default: break
            }
        }
        
        return updatedModes
    }
    
    private func fillSettings(json: NewDeviceDiscoveryResult<GenericDeviceData>
    ) -> [String: SettingDefinition] {
        var settings: [String: SettingDefinition] = [:]
        json.data.settings.forEach { setting in
            settings[setting.item] = SettingDefinition(commandName: setting.commandName,
                                                       item: setting.item,
                                                       type: setting.type,
                                                       valueType: setting.valueType,
                                                       values: setting.values,
                                                       length: setting.length,
                                                       position: setting.position)
        }
        
        return settings
    }
}
