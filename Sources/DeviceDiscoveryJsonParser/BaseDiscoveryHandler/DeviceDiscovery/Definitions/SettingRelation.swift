//
//  SettingRelation.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct SettingRelation: Decodable {    
    public let item: String
    public let relations: [NewRelationship]
}
