//
//  ProgramDefinition.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct ProgramDefinition: Decodable {
    public let commandName: String
    public let item: String
    public let valueType: String
    public let values: [ProgramValue]
}

public struct ProgramValue: Decodable {
    public let commandValue: Int
    public let value: String
    public let orderIndex: Int
    public let includedOptions: [NewIncludedOption]
    public let isSelectable: Bool?
    public let waterBar: Int?
    public let ecoMode: Bool?
    public let maxKg: Int?
    public let electricBar: Int?
    public let downloadableProgram: NewDownloadableProgram?
    public let cookLikeChefFriendyName: String?
    public let availableTemperatures: NewTemperatures?
}

public struct NewIncludedOption: Codable {
    public let item: String
    public let values: [NewValues]?
    public let isSelectable: Bool?
}

public struct NewDownloadableProgram: Codable {
    public let key: String?
}

public struct NewValues: Codable {
    public let value: String
}
