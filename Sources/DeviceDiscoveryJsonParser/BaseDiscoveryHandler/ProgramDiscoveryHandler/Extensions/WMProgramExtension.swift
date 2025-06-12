//
//  WMProgramExtension.swift
//  UmbrellaApp
//
//  Created by Alperen on 21.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

extension ProgramDiscoveryHandler where GenericDeviceData: IWMDeviceData {
    func commonMappedData(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> (
        programs: [String: NewProgram],
        menu: [String: NewMenuItem],
        mainModel: String,
        commands: [CommandDefinition],
        status: [StatusDefinition],
        options: [OptionDefinition],
        error: [ErrorDefinition],
        feature: String
    ) {
        return (
            programs: fillOptionDataPrograms(json: json),
            menu: fillOptionDataMenu(json: json),
            mainModel: fillDeviceModel(json: json),
            commands: fillDeviceCommands(json: json),
            status: fillOptionDataStatus(json: json),
            options: fillOptionDataOptions(json: json),
            error: fillErrors(json: json),
            feature: fillDeviceFeature(json: json)
        )
    }
    
    private func fillOptionRelationsForOption(json: NewDeviceDiscoveryResult<GenericDeviceData>, key: String) -> [NewRelationship] {
        var relations: [NewRelationship] = []
        for optionRelation in json.data.optionRelations where optionRelation.value == key {
            relations.append(contentsOf: optionRelation.relations)
            return relations
        }
        
        return []
    }
    
    func fillOptionDataMenu(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [String: NewMenuItem] {
        var menu: [String: NewMenuItem] = [:]
        for op in json.data.options {
            menu[op.item] = NewMenuItem(isExist: true,
                                     values: op.values,
                                     valueLimits: op.valueLimits,
                                     supportedStates: op.supportedStates,
                                     supportedPhases: op.supportedPhases,
                                     optionRelationsForItem: fillOptionRelationsForOption(json: json, key: op.item),
                                     position: op.position,
                                     length: op.length,
                                     commandName: op.commandName)
        }
        
        return menu
    }
}
