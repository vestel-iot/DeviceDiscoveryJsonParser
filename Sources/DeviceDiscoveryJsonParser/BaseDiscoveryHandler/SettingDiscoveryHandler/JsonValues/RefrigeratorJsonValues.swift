//
//  RefrigeratorJsonValues.swift
//  DeviceDiscoveryJsonParser
//
//  Created by Alperen on 12.06.2025.
//

import Foundation

class RefrigeratorJsonValues {
    static func getMainTemp(key: String) -> String? {
        switch RefrigeratorFridgeCoolerMainTemperature(rawValue: key) {
        case .off: return "0"
        case .degree1: return "1"
        case .degree2: return "2"
        case .degree3: return "3"
        case .degree4: return "4"
        case .degree5: return "5"
        case .degree6: return "6"
        case .degree7: return "7"
        case .degree8: return "8"
        case .superCool: return "SuperCool"
        default: return nil
        }
    }

    static func getZone1TemperatureCooler(key: String) -> String? {
        switch RefrigeratorFridgeCoolerZone1Temperature(rawValue: key) {
        case .off: return "0"
        case .degree1: return "1"
        case .degree2: return "2"
        case .degree3: return "3"
        case .degree4: return "4"
        case .degree5: return "5"
        case .degree6: return "6"
        case .degree7: return "7"
        case .degree8: return "8"
        case .vitaStore: return "VitaStore"
        default: return nil
        }
    }

    static func getZone1TemperatureFreezer(key: String) -> String? {
        switch RefrigeratorFridgeFreezerZone1Temperature(rawValue: key) {
        case .off: return "0"
        case .m14: return "-14"
        case .m15: return "-15"
        case .m16: return "-16"
        case .m17: return "-17"
        case .m18: return "-18"
        case .m19: return "-19"
        case .m20: return "-20"
        case .m21: return "-21"
        case .m22: return "-22"
        case .m23: return "-23"
        case .m24: return "-24"
        case .superFreeze: return "SuperFreeze"
        default: return nil
        }
    }

    static func getZone2TemperatureCooler(key: String) -> String? {
        switch RefrigeratorFridgeCoolerZone2Temperature(rawValue: key) {
        case .off: return "0"
        case .degree1: return "1"
        case .degree2: return "2"
        case .degree3: return "3"
        case .degree4: return "4"
        case .degree5: return "5"
        case .degree6: return "6"
        case .degree7: return "7"
        case .degree8: return "8"
        default: return nil
        }
    }

    static func getZone2TemperatureFreezer(key: String) -> String? {
        switch RefrigeratorFridgeFreezerZone2Temperature(rawValue: key) {
        case .off: return "0"
        case .m14: return "-14"
        case .m15: return "-15"
        case .m16: return "-16"
        case .m17: return "-17"
        case .m18: return "-18"
        case .m19: return "-19"
        case .m20: return "-20"
        case .m21: return "-21"
        case .m22: return "-22"
        case .m23: return "-23"
        case .m24: return "-24"
        case .superFreeze: return "SuperFreeze"
        default: return nil
        }
    }
}
