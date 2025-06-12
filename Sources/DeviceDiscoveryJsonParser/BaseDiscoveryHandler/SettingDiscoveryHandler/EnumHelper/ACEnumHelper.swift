//
//  File.swift
//  DeviceDiscoveryJsonParser
//
//  Created by Alperen on 12.06.2025.
//

import Foundation

enum ACSettings: String, CaseIterable {
    case mode = "Mode"
    case temperature = "Temperature"
    case UVC = "UVC"
    case speed = "Speed"
    
    var value: String {
        return rawValue
    }
}
