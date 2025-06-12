//
//  NewProgram.swift
//  DeviceDiscoveryJsonParser
//
//  Created by Alperen on 12.06.2025.
//

import Foundation

public struct NewProgram: Codable {
    public let isExist: Bool
    public let commandValue: Int
    public let orderIndex: Int
    public let maxKg: Int?
    public let electricBar: Int?
    public let waterBar: Int?
    public let ecoMode: Bool?
    public let includedOptions: [NewIncludedOption?]
    public let downloadableProgram: String?
    public let availableTemperatures: NewTemperatures?
    
    public init(isExist: Bool = false, commandValue: Int, orderIndex: Int, includedOptions : [NewIncludedOption?], availableTemperatures: NewTemperatures?) {
        self.isExist = isExist
        self.commandValue = commandValue
        self.orderIndex = orderIndex
        self.includedOptions = includedOptions
        self.availableTemperatures = availableTemperatures
        self.maxKg = nil
        self.electricBar = nil
        self.waterBar = nil
        self.ecoMode = nil
        self.downloadableProgram = nil
    }
    
    public init(isExist: Bool = false, commandValue: Int,
                orderIndex: Int, includedOptions: [NewIncludedOption?],
                maxKg: Int? = nil, electricBar: Int? = nil,
                waterBar: Int? = nil, ecoMode: Bool? = nil,
                downloadableProgram: String? = nil, availableTemperatures: NewTemperatures? = nil) {
        self.isExist = isExist
        self.commandValue = commandValue
        self.orderIndex = orderIndex
        self.includedOptions = includedOptions
        self.maxKg = maxKg
        self.electricBar = electricBar
        self.waterBar = waterBar
        self.ecoMode = ecoMode
        self.downloadableProgram = downloadableProgram
        self.availableTemperatures = availableTemperatures
    }
}
