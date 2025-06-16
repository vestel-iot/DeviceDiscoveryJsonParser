//
//  BaseDiscoveryHandler.swift
//  UmbrellaApp
//
//  Created by Alperen on 20.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation

public protocol BaseDiscoveryHandler: AnyObject {
    associatedtype OptionData
    associatedtype ErrorResponsePlaceHolder
    associatedtype GenericDeviceData: DefaultNativeWGDeviceData

    static var shared: Self { get }

    func map(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> OptionData
    
    func getJson(
        uuid: String,
        onSuccess: @escaping (OptionData) -> Void,
        onError: @escaping (ErrorResponsePlaceHolder?) -> Void
    )
}

extension BaseDiscoveryHandler  {
    func fillOptionDataStatus (json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [StatusDefinition] {
        return extract(json, \.status)
    }
    
    func fillErrors(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> [ErrorDefinition] {
        return extract(json, \.errors)
    }
    
    func fillDeviceModel(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> String {
        return extract(json, \.deviceModel)
    }
    
    func fillDeviceFeature(json: NewDeviceDiscoveryResult<GenericDeviceData>) -> String {
        return extract(json, \.feature) ?? ""
    }
}


extension BaseDiscoveryHandler {
    func extract<T>(_ json: NewDeviceDiscoveryResult<GenericDeviceData>,
                    _ keyPath: KeyPath<GenericDeviceData, T>) -> T {
        return json.data[keyPath: keyPath]
    }
}
