//
//  NewRefrigeratorData.swift
//  UmbrellaApp
//
//  Created by Alperen on 30.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

struct NewRefrigeratorData: Codable {
    let mainModel: String
    let status: [StatusDefinition]
    let settings: [String: SettingDefinition]
    let settingRelations: [String: [NewObjectRelation]]
    let setting: SettingData?
    let errors: [ErrorDefinition]
    let feature: String
    
    struct SettingData: Codable {
        let modes: [NewSettingValues]?
        let refrigeratorDict: [String: [String: Int]]
        let mainMode: NewSettingValues?
    }
}
