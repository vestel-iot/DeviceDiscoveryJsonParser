//
//  SettingsDeviceData.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

/// For based which 'Settings' such as AC & Refrigerator
public protocol SettingsDeviceData: DefaultNativeWGDeviceData,
                                    HasSettings,
                                    HasSettingRelations {}
