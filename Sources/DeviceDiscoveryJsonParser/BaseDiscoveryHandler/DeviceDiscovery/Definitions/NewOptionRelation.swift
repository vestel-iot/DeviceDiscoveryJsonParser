//
//  NewOptionRelation.swift
//  V-SDK
//
//  Created by Alperen on 6.05.2025.
//

import Foundation

public struct NewObjectRelation: Codable {
    public init(value: String, relations: [NewRelationship]) {
        self.value = value
        self.relations = relations
    }

    public let value: String
    public let relations: [NewRelationship]
}

public struct NewRelationship: Codable {
    public let andCondition: [NewConditionKey]
    public let statements: [NewRelationValue]
}

public struct NewRelations: Codable, Hashable {
    public let key: String?
    public let values: [NewSettingRelationValue]?
}

public struct NewRelationValue: Codable, Hashable {
    public init(value: String, isSelectable: Bool? = nil, clientAction: Bool? = nil, valueLimits: NewValueLimits? = nil) {
        self.value = value
        self.isSelectable = isSelectable
        self.clientAction = clientAction
        self.valueLimits = valueLimits
    }

    public let value: String
    public let isSelectable: Bool?
    public let clientAction: Bool?
    public let valueLimits: NewValueLimits?
}

public struct NewSettingRelationValue: Codable, Hashable {
    public let value: String?
    public let isSelectable: Bool?
}
