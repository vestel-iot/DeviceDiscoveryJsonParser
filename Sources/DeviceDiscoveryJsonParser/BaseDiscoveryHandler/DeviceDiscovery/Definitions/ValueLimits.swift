//
//  ValueLimits.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public struct NewValueLimits: Codable, Hashable {
    public let scale: Int
    public let unit: String?
    public let step: Int
    public let min: Int
    public let max: Int
}
