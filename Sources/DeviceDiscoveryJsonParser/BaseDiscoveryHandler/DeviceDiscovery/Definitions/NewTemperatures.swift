//
//  File.swift
//  DeviceDiscoveryJsonParser
//
//  Created by Alperen on 12.06.2025.
//

import Foundation

public struct NewTemperatures: Codable {
    public let minTemperature: Int
    public let maxTemperature: Int
    public let incrementValue: Int
    public let defaultTemperature: Bool? //TODO: -JSON- burasi defaultValue olabilir mi? bi kontrol sagla sonrasinda
}
