//
//  File.swift
//  DeviceDiscoveryJsonParser
//
//  Created by Alperen on 12.06.2025.
//

import Foundation

enum RefrigeratorRFSettings: String, CaseIterable {
    case freezer = "Freezer.Temperature"
    case cooler = "Cooler.Temperature"
    case childLock = "ChildLock"
    case screenSaver = "ScreenSaver"
    case mode = "Mode"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorRFSettingMode: String, CaseIterable {
    case normal = "Normal"
    case superFreeze = "SuperFreeze"
    case superCooler = "SuperCooler"
    case eco = "Eco"
    case holiday = "Holiday"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorFridgeFreezerZone2Temperature: String, CaseIterable {
    case off = "Off"
    case m14 = "M14"
    case m15 = "M15"
    case m16 = "M16"
    case m17 = "M17"
    case m18 = "M18"
    case m19 = "M19"
    case m20 = "M20"
    case m21 = "M21"
    case m22 = "M22"
    case m23 = "M23"
    case m24 = "M24"
    case superFreeze = "SuperFreeze"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorFridgeCoolerZone2Temperature: String, CaseIterable {
    case off = "Off"
    case degree1 = "1C"
    case degree2 = "2C"
    case degree3 = "3C"
    case degree4 = "4C"
    case degree5 = "5C"
    case degree6 = "6C"
    case degree7 = "7C"
    case degree8 = "8C"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorFridgeFreezerZone1Temperature: String, CaseIterable {
    case off = "Off"
    case m14 = "M14"
    case m15 = "M15"
    case m16 = "M16"
    case m17 = "M17"
    case m18 = "M18"
    case m19 = "M19"
    case m20 = "M20"
    case m21 = "M21"
    case m22 = "M22"
    case m23 = "M23"
    case m24 = "M24"
    case superFreeze = "SuperFreeze"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorFridgeCoolerZone1Temperature: String, CaseIterable {
    case off = "Off"
    case degree1 = "1C"
    case degree2 = "2C"
    case degree3 = "3C"
    case degree4 = "4C"
    case degree5 = "5C"
    case degree6 = "6C"
    case degree7 = "7C"
    case degree8 = "8C"
    case vitaStore = "VitaStore"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorFridgeCoolerMainTemperature: String, CaseIterable {
    case off = "Off"
    case degree1 = "1C"
    case degree2 = "2C"
    case degree3 = "3C"
    case degree4 = "4C"
    case degree5 = "5C"
    case degree6 = "6C"
    case degree7 = "7C"
    case degree8 = "8C"
    case superCool = "SuperCool"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorSettings: String, CaseIterable {
    case mainCooler = "FridgeCooler.Main.Temperature"
    case zone1Cooler = "FridgeCooler.Zone1.Temperature"
    case zone2Cooler = "FridgeCooler.Zone2.Temperature"
    case zone1Freezer = "FridgeFreezer.Zone1.Temperature"
    case zone2Freezer = "FridgeFreezer.Zone2.Temperature"
    case modeCooler = "FridgeCooler.Mode"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorSettingMode: String, CaseIterable {
    case unknown = "None"
    case eco = "Eco"
    case holiday = "Holiday"
    
    var value: String {
        return rawValue
    }
}

enum RefrigeratorSettingRelations: String, CaseIterable {
    case mainCooler = "FridgeCooler.Main.Temperature"
    case zone1Cooler = "FridgeCooler.Zone1.Temperature"
    case zone2Cooler = "FridgeCooler.Zone2.Temperature"
    case zone1Freezer = "FridgeFreezer.Zone1.Temperature"
    case zone2Freezer = "FridgeFreezer.Zone2.Temperature"
    
    var value: String {
        return rawValue
    }
}
