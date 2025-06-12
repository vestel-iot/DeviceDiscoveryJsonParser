//
//  ACSettingExtension.swift
//  UmbrellaApp
//
//  Created by Alperen on 28.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

extension SettingDiscoveryHandler where GenericDeviceData: IACDeviceData {
    func commonMappedData(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> (
        mainModel: String,
        status: [StatusDefinition],
        settings: [String: SettingDefinition],
        settingRelations: [String: [NewObjectRelation]],
        setting: NewACOptionData.SettingData?,
        commands: [CommandDefinition],
        errors: [ErrorDefinition],
        feature: String,
        displayWorkarounds: [String: [NewDisplayWorkarounds]]?
    ) {
        return (
            mainModel: fillDeviceModel(json: json),
            status: fillOptionDataStatus(json: json),
            settings: fillDeviceSettings(json: json),
            settingRelations: fillSettingRelations(json: json),
            setting: fillSettingsValue(json: json),
            commands: fillDeviceCommands(json: json),
            errors: fillErrors(json: json),
            feature: fillDeviceFeature(json: json),
            displayWorkarounds: fillDisplayWorkarounds(json: json)
        )
    }
    
    func fillSettingsValue(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> NewACOptionData.SettingData? {
        var modes: [NewSettingValues] = []

        for data in json.data.settings {
            switch ACSettings(rawValue: data.item) {
            case .mode:
                modes = data.values ?? []
            default: break
            }
        }
        
        return NewACOptionData.SettingData(modes: modes, airConditionerDict: [:], mainMode: nil)
    }
    
    private func fillDisplayWorkarounds(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [String: [NewDisplayWorkarounds]] {
        guard let displayWorkaroundsData = json.data.displayWorkarounds else { return [:] }

        let pairs = displayWorkaroundsData.flatMap { item in
            item.workaround.map { wr in
                (key: wr.item ?? "",
                 entry: NewDisplayWorkarounds(
                     andCondition: item.andCondition,
                     workaround: item.workaround
                 ))
            }
        }
        
        let grouped = Dictionary(
            grouping: pairs,
            by: { $0.key }
        ).mapValues { $0.map { $0.entry } }

        return grouped
    }
    
    func fillDeviceCommands(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [CommandDefinition] {
        return extract(json, \.commands)
    }
}
