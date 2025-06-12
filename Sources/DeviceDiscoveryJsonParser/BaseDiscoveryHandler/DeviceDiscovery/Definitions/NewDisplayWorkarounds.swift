//
//  NewDisplayWorkarounds.swift
//  V-SDK
//
//  Created by Alperen on 6.05.2025.
//

import Foundation

public struct NewDisplayWorkarounds: Codable {
    public init(andCondition: [NewConditionKey], workaround: [NewWorkarounds]) {
        self.andCondition = andCondition
        self.workaround = workaround
    }
    
    public let andCondition: [NewConditionKey]
    public let workaround: [NewWorkarounds]
}

public struct NewConditionKey: Codable, Hashable {
    public let value: String
    public let item: String?
}

public struct NewWorkarounds: Codable, Hashable {
    public init(item: String? = nil, value: String) {
        self.item = item
        self.value = value
    }
    public let item: String?
    public let value: String
}
