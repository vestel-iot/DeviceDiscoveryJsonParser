//
//  WashingMachineDeviceData.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct WashingMachineDeviceData: IWMDeviceData {
    public var optionRelations: [NewObjectRelation]
    
    public var deviceType: String
    
    public var feature: String?
    
    public var regulationVersion: String
    
    public var deviceModel: String
    
    public var variant: String
    
    public var errors: [ErrorDefinition]
    
    public var status: [StatusDefinition]
    
    public var commands: [CommandDefinition]
    
    public var programs: [ProgramDefinition]
    
    public var options: [OptionDefinition]
}
