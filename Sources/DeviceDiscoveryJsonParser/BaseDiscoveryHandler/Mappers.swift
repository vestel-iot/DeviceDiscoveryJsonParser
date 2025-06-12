//
//  Mappers.swift
//  UmbrellaApp
//
//  Created by Alperen on 20.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

//MARK: - WM
extension ProgramDiscoveryHandler where GenericDeviceData: IWMDeviceData, OptionData == NewWMOptionData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(
            programs: common.programs,
            menu: common.menu,
            mainModel: common.mainModel,
            commands: common.commands,
            status: common.status,
            options: common.options,
            errors: common.error,
            feature: common.feature
        )
    }
}

//MARK: - WD
extension ProgramDiscoveryHandler where GenericDeviceData: IWDDeviceData, OptionData == NewWDOptionData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(
            programs: common.programs,
            menu: common.menu,
            mainModel: common.mainModel,
            commands: common.commands,
            status: common.status,
            options: common.options,
            errors: common.error,
            feature: common.feature
        )
    }
}

//MARK: - DW
extension ProgramDiscoveryHandler where GenericDeviceData: IDWDeviceData, OptionData == NewDWOptionData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(
            programs: common.programs,
            menu: common.menu,
            mainModel: common.mainModel,
            commands: common.commands,
            status: common.status,
            options: common.options,
            errors: common.error,
            feature: common.feature
        )
    }
}

//MARK: - OV
extension ProgramDiscoveryHandler where GenericDeviceData: IOVDeviceData, OptionData == NewOVOptionData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(
            programs: common.programs,
            menu: common.menu,
            mainModel: common.mainModel,
            commands: common.commands,
            status: common.status,
            options: common.options,
            errors: common.error,
            feature: common.feature
        )
    }
}

//MARK: - TD
extension ProgramDiscoveryHandler where GenericDeviceData: ITDDeviceData, OptionData == NewTDOptionData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(programs: common.programs,
                          menu: common.menu,
                          mainModel: common.mainModel,
                          commands: common.commands,
                          status: common.status,
                          options: common.options,
                          errors: common.error,
                          feature: common.feature,
                          energyLabel: common.energyLabel,
                          prglist: common.prglist)
    }
}

//MARK: - AC
extension SettingDiscoveryHandler where GenericDeviceData: IACDeviceData, OptionData == NewACOptionData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(mainModel: common.mainModel,
                          status: common.status,
                          settings: common.settings,
                          settingRelations: common.settingRelations,
                          setting: common.setting,
                          commands: common.commands,
                          errors: common.errors,
                          feature: common.feature,
                          displayWorkarounds: common.displayWorkarounds
                                    
        )
    }
}

//MARK: - RF
extension SettingDiscoveryHandler where GenericDeviceData: IRFDeviceData, OptionData == NewRefrigeratorData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(mainModel: common.mainModel,
                          status: common.status,
                          settings: common.settings,
                          settingRelations: common.settingRelations,
                          setting: common.setting,
                          errors: common.errors,
                          feature: common.feature)
    }
}

//MARK: - FD
extension SettingDiscoveryHandler where GenericDeviceData: IFDDeviceData, OptionData == NewRefrigeratorData {
    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData {
        let common = commonMappedData(json: json)
        return OptionData(mainModel: common.mainModel,
                          status: common.status,
                          settings: common.settings,
                          settingRelations: common.settingRelations,
                          setting: common.setting,
                          errors: common.errors,
                          feature: common.feature)
    }
}
