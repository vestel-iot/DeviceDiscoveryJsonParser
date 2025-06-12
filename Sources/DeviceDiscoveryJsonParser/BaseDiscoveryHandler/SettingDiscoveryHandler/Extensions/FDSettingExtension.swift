//
//  FDSettingExtension.swift
//  UmbrellaApp
//
//  Created by Alperen on 30.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

extension SettingDiscoveryHandler where GenericDeviceData: IFDDeviceData {
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
            settingRelations: fillSettingRelations(json: json),
            setting: fillSettingsValue(json: json),
            errors: fillErrors(json: json),
            feature: fillDeviceFeature(json: json)
        )
    }
    
    private func fillSettingsValue(json: NewDeviceDiscoveryResult<GenericDeviceData>
    ) -> NewRefrigeratorData.SettingData {
        var modes: [NewSettingValues] = []
        var mainCooler: [String: Int] = [:]
        var zone1Cooler: [String: Int] = [:]
        var zone1Freezer: [String: Int] = [:]
        var zone2Cooler: [String: Int] = [:]
        var zone2Freezer: [String: Int] = [:]
        var refrigeratorDict: [String: [String: Int]] = [:]
        
        for setting in json.data.settings {
            switch RefrigeratorSettings(rawValue: setting.item) {
            case .mainCooler:
                for item in setting.values ?? [] {
                    mainCooler[item.value ?? ""] = item.commandValue
                }
                refrigeratorDict[setting.item] = mainCooler
            case .zone1Cooler:
                for item in setting.values ?? [] {
                    zone1Cooler[item.value ?? ""] = item.commandValue
                }
                refrigeratorDict[setting.item] = zone1Cooler
            case .zone1Freezer:
                for item in setting.values ?? [] {
                    zone1Freezer[item.value ?? ""] = item.commandValue
                }
                refrigeratorDict[setting.item] = zone1Freezer
            case .zone2Cooler:
                for item in setting.values ?? [] {
                    zone2Cooler[item.value ?? ""] = item.commandValue
                }
                refrigeratorDict[setting.item] = zone2Cooler
            case .zone2Freezer:
                for item in setting.values ?? [] {
                    zone2Freezer[item.value ?? ""] = item.commandValue
                }
                refrigeratorDict[setting.item] = zone2Freezer
            case .modeCooler:
                modes = setting.values ?? []
            default: break
            }
        }
        var unknownMode: NewSettingValues?
        var updatedMode: [NewSettingValues] = []
        for mode in modes {
            if mode.value == RefrigeratorSettingMode.unknown.value {
                unknownMode = NewSettingValues(
                    commandValue: mode.commandValue,
                    value: mode.value,
                    incompatibleSettings: nil,
                    includedSettings: [],
                    orderIndex: mode.orderIndex,
                    electricBar: mode.electricBar)
                for includedSetting in mode.includedSettings ?? [] {
                    switch RefrigeratorSettingRelations(rawValue: includedSetting.item) {
                    case .mainCooler:
                        unknownMode?.includedSettings?.append(
                            NewIncludedSettings(
                                item: includedSetting.item,
                                values: getMainIncludedSettings(
                                    dict: mainCooler,
                                    values: includedSetting.values ?? [])))
                    case .zone1Cooler:
                        unknownMode?.includedSettings?.append(
                            NewIncludedSettings(
                                item: includedSetting.item,
                                values: getZone1CoolerIncludedSettings(
                                    dict: zone1Cooler,
                                    values: includedSetting.values ?? [])))
                    case .zone1Freezer:
                        unknownMode?.includedSettings?.append(
                            NewIncludedSettings(
                                item: includedSetting.item,
                                values: getZone1FreezerIncludedSettings(
                                    dict: zone1Freezer,
                                    values: includedSetting.values ?? [])))
                    case .zone2Cooler:
                        unknownMode?.includedSettings?.append(
                            NewIncludedSettings(
                                item: includedSetting.item,
                                values: getZone2CoolerIncludedSettings(
                                    dict: zone2Cooler,
                                    values: includedSetting.values ?? [])))
                    case .zone2Freezer:
                        unknownMode?.includedSettings?.append(
                            NewIncludedSettings(
                                item: includedSetting.item,
                                values: getZone2FreezerIncludedSettings(
                                    dict: zone2Freezer,
                                    values: includedSetting.values ?? [])))
                    default: break
                    }
                }
                if let unknownMode = unknownMode {
                    updatedMode.append(unknownMode)
                }
            } else {
                updatedMode.append(mode)
            }
        }
        return NewRefrigeratorData.SettingData(
            modes: updatedMode,
            refrigeratorDict: refrigeratorDict,
            mainMode: unknownMode)
    }
    
    private func getMainIncludedSettings(dict: [String: Int], values: [NewIncludedSettingsValues])
    -> [NewIncludedSettingsValues] {
        var includedSettings: [NewIncludedSettingsValues] = []
        for value in values {
            includedSettings.append(
                NewIncludedSettingsValues(
                    value: value.value,
                    commandValue: dict[value.value ?? ""],
                    temperature: RefrigeratorJsonValues.getMainTemp(key: value.value ?? ""),
                    defaultValue: value.defaultValue))
        }
        return includedSettings
    }
    
    private func getZone1CoolerIncludedSettings(
        dict: [String: Int], values: [NewIncludedSettingsValues]
    ) -> [NewIncludedSettingsValues] {
        var includedSettings: [NewIncludedSettingsValues] = []
        for value in values {
            includedSettings.append(
                NewIncludedSettingsValues(
                    value: value.value,
                    commandValue: dict[value.value ?? ""],
                    temperature: RefrigeratorJsonValues.getZone1TemperatureCooler(
                        key: value.value ?? ""),
                    defaultValue: value.defaultValue))
        }
        return includedSettings
    }
    
    private func getZone1FreezerIncludedSettings(
        dict: [String: Int], values: [NewIncludedSettingsValues]
    ) -> [NewIncludedSettingsValues] {
        var includedSettings: [NewIncludedSettingsValues] = []
        for value in values {
            includedSettings.append(
                NewIncludedSettingsValues(
                    value: value.value,
                    commandValue: dict[value.value ?? ""],
                    temperature: RefrigeratorJsonValues.getZone1TemperatureCooler(
                        key: value.value ?? ""),
                    defaultValue: value.defaultValue))
        }
        return includedSettings
    }
    
    private func getZone2CoolerIncludedSettings(
        dict: [String: Int], values: [NewIncludedSettingsValues]
    ) -> [NewIncludedSettingsValues] {
        var includedSettings: [NewIncludedSettingsValues] = []
        for value in values {
            includedSettings.append(
                NewIncludedSettingsValues(
                    value: value.value,
                    commandValue: dict[value.value ?? ""],
                    temperature: RefrigeratorJsonValues.getZone2TemperatureCooler(
                        key: value.value ?? ""),
                    defaultValue: value.defaultValue))
        }
        return includedSettings
    }
    
    private func getZone2FreezerIncludedSettings(
        dict: [String: Int], values: [NewIncludedSettingsValues]
    ) -> [NewIncludedSettingsValues] {
        var includedSettings: [NewIncludedSettingsValues] = []
        for value in values {
            includedSettings.append(
                NewIncludedSettingsValues(
                    value: value.value,
                    commandValue: dict[value.value ?? ""],
                    temperature: RefrigeratorJsonValues.getZone2TemperatureFreezer(
                        key: value.value ?? ""),
                    defaultValue: value.defaultValue))
        }
        return includedSettings
    }
    
    private func getIncludedSettings(dict: [String: Int],
                                     values: [NewIncludedSettingsValues]
    ) -> [NewIncludedSettingsValues] {
        var includedSettings: [NewIncludedSettingsValues] = []
        for value in values {
            includedSettings.append(
                NewIncludedSettingsValues(
                    value: value.value,
                    commandValue: dict[value.value ?? ""],
                    temperature: RefrigeratorJsonValues.getMainTemp(key: value.value ?? ""),
                    defaultValue: value.defaultValue))
        }
        return includedSettings
    }
    
    private func fillSettings(json: NewDeviceDiscoveryResult<GenericDeviceData>
    ) -> [String: SettingDefinition] {
        var settings: [String: SettingDefinition] = [:]
        json.data.settings.forEach { setting in
            settings[setting.item] = SettingDefinition(commandName: setting.commandName,
                                                       item: setting.item,
                                                       valueType: setting.valueType,
                                                       values: setting.values)
        }
        
        return settings
    }
}
