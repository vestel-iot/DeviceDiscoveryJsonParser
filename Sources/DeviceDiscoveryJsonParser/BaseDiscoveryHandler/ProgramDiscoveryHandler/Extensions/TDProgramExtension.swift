//
//  TDProgramExtension.swift
//  UmbrellaApp
//
//  Created by Alperen on 21.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

extension ProgramDiscoveryHandler where GenericDeviceData: ITDDeviceData {
    func commonMappedData(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> (
        programs: [String: NewProgram],
        menu: [String: NewMenuItem],
        mainModel: String,
        commands: [CommandDefinition],
        status: [StatusDefinition],
        options: [OptionDefinition],
        error: [ErrorDefinition],
        feature: String,
        energyLabel: String,
        prglist: String
    ) {
        return (
            programs: fillOptionDataPrograms(json: json),
            menu: fillOptionDataMenu(json: json),
            mainModel: fillDeviceModel(json: json),
            commands: fillDeviceCommands(json: json),
            status: fillOptionDataStatus(json: json),
            options: fillOptionDataOptions(json: json),
            error: fillErrors(json: json),
            feature: fillDeviceFeature(json: json),
            energyLabel: fillDeviceEnergLabel(json: json),
            prglist: fillDevicePrglist(json: json)
        )
    }
    
    func fillOptionDataMenu(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [String: NewMenuItem] {
        var menu: [String: NewMenuItem] = [:]
        for op in json.data.options {
            menu[op.item] = NewMenuItem(isExist: true,
                                     values: op.values,
                                     valueLimits: op.valueLimits,
                                     supportedStates: op.supportedStates,
                                     supportedPhases: op.supportedPhases)
        }
        
        return menu
    }
    
    func fillDeviceEnergLabel (json: NewDeviceDiscoveryResult<GenericDeviceData>) -> String {
        return extract(json, \.energyLabel)
    }
    
    func fillDevicePrglist (json: NewDeviceDiscoveryResult<GenericDeviceData>) -> String {
        return extract(json, \.prglist)
    }
}
