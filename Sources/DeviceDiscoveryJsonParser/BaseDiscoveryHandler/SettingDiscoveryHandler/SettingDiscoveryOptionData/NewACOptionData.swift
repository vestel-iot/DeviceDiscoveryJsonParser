//
//  NewACOptionData.swift
//  UmbrellaApp
//
//  Created by Alperen on 27.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

public struct NewACOptionData: Codable {
    let mainModel: String
    let status: [StatusDefinition]
    let settings: [String: SettingDefinition]
    let settingRelations: [String: [NewObjectRelation]]
    let setting: SettingData?
    let commands: [CommandDefinition]
    let errors: [ErrorDefinition]
    let feature: String
    let displayWorkarounds: [String: [NewDisplayWorkarounds]]?
    
    struct SettingData: Codable {
        let modes: [NewSettingValues]?
        let airConditionerDict: [String: [String: Int]]
        let mainMode: NewSettingValues?
    }
}
