//
//  DefaultNativeWGDeviceData.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

public protocol DefaultNativeWGDeviceData: Decodable {
    var deviceType: String          { get }
    var feature: String?            { get }
    var regulationVersion: String   { get }
    var deviceModel: String         { get }
    var variant: String             { get }
    var errors: [ErrorDefinition]   { get }
    var status: [StatusDefinition]  { get }
}
