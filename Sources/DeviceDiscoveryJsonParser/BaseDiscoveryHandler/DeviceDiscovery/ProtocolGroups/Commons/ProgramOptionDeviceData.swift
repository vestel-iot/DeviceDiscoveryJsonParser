//
//  ProgramOptionDeviceData.swift
//  V-SDK
//
//  Created by Alperen on 21.04.2025.
//

import Foundation

/// For based which 'Program + Option' such as DW & WM & TD & Oven
public protocol ProgramOptionDeviceData: DefaultNativeWGDeviceData,
                                         HasCommands,
                                         HasPrograms,
                                         HasOptions {}
