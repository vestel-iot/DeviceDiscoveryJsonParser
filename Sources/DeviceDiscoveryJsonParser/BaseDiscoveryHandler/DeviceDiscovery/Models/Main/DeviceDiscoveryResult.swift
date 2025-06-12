//
//  DeviceDiscoveryResult.swift
//  V-SDK
//
//  Created by Alperen on 22.04.2025.
//

import Foundation

public struct NewDeviceDiscoveryResult<P: DefaultNativeWGDeviceData>: Decodable {
    public let data: P
    public let message: String
    public let status: Int
}
