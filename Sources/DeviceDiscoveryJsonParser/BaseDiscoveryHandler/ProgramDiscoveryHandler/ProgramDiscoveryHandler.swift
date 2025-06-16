//
//  ProgramDiscoveryHandler.swift
//  UmbrellaApp
//
//  Created by Alperen on 20.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

public protocol ProgramDiscoveryHandler: BaseDiscoveryHandler { }

extension ProgramDiscoveryHandler where GenericDeviceData: ProgramOptionDeviceData {
    func fillOptionDataPrograms(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [String: NewProgram] {
        var programList: [String: NewProgram] = [:]
        for programs in json.data.programs {
            programs.values.forEach { pr in
                programList[pr.value] = NewProgram(
                    isExist: true,
                    commandValue: pr.commandValue,
                    orderIndex: pr.orderIndex,
                    includedOptions: pr.includedOptions,
                    maxKg: pr.maxKg,
                    electricBar: pr.electricBar,
                    waterBar: pr.waterBar,
                    ecoMode: pr.ecoMode,
                    downloadableProgram: pr.downloadableProgram?.key,
                    availableTemperatures: pr.availableTemperatures
                )
            }
        }
        
        return programList
    }
    
    func fillOptionDataOptions (json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [OptionDefinition] {
        return extract(json, \.options)
    }
    
    func fillDeviceCommands(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [CommandDefinition] {
        return extract(json, \.commands)
    }
}
