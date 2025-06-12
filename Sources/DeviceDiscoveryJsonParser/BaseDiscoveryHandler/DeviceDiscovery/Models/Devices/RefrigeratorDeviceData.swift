//
//  RefrigeratorDeviceData.swift
//  V-SDK
//
//  Created by Alperen on 6.05.2025.
//

import Foundation

public struct RefrigeratorDeviceData: IRFDeviceData {
    public var deviceType: String
    
    public var feature: String?
    
    public var regulationVersion: String
    
    public var deviceModel: String
    
    public var variant: String
    
    public var errors: [ErrorDefinition]
    
    public var status: [StatusDefinition]
    
    public var settings: [SettingDefinition]
    
    public var settingRelations: [SettingRelation?]
}
