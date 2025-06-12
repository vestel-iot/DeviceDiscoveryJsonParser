//
//  NewDWOptionData.swift
//  UmbrellaApp
//
//  Created by Alperen on 21.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

struct NewDWOptionData: Codable {
    let programs: [String: NewProgram]
    let menu: [String: NewMenuItem]
    let mainModel: String
    let commands: [CommandDefinition]
    let status: [StatusDefinition]
    let options: [OptionDefinition]
    let errors: [ErrorDefinition]
    let feature: String
}
