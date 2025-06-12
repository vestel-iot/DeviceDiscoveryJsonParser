//
//  NewWMDiscoveryHandler.swift
//  UmbrellaApp
//
//  Created by Alperen on 22.05.2025.
//  Copyright © 2025 Inoxoft Inc. All rights reserved.
//

import Foundation


//final class NewWDDiscoveryHandler: ProgramDiscoveryHandler {
//    nonisolated(unsafe) static let shared = NewWDDiscoveryHandler()
//    
//    typealias GenericDeviceData = WasherDryerDeviceData
//    typealias OptionData = NewWDOptionData
//    
//    func getJson(
//        uuid: String,
//        onSuccess: @escaping (OptionData) -> Void,
//        onError: @escaping (ErrorResponse?) -> Void
//    ) {
//        // 1. Locate your dummy JSON in the test bundle
//        guard let url = Bundle.main.url(
//                forResource: uuid,
//                withExtension: "json")
//        else {
//            return onError(nil)
//        }
//
//        do {
//            // 2. Decode it into the real model
//            let data = try Data(contentsOf: url)
//            // Debug: print raw JSON to help identify decoding mismatches
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("WM JSON data: \(jsonString)")
//            }
//            let result = try JSONDecoder()
//                .decode(NewDeviceDiscoveryResult<GenericDeviceData>.self,
//                        from: data)
//
//            // 3. Map and callback
//            let optionData = map(json: result)
//            onSuccess(optionData)
//        } catch let decodingError as DecodingError {
//            switch decodingError {
//            case .keyNotFound(let key, let context):
//                let path = context.codingPath.map { $0.stringValue }.joined(separator: ".")
//                print("DecodingError.keyNotFound at '\(path)': missing key '\(key)' – \(context.debugDescription)")
//            case .typeMismatch(let type, let context):
//                let path = context.codingPath.map { $0.stringValue }.joined(separator: ".")
//                print("DecodingError.typeMismatch at '\(path)': expected type '\(type)' – \(context.debugDescription)")
//            case .valueNotFound(let value, let context):
//                let path = context.codingPath.map { $0.stringValue }.joined(separator: ".")
//                print("DecodingError.valueNotFound at '\(path)': missing value '\(value)' – \(context.debugDescription)")
//            case .dataCorrupted(let context):
//                let path = context.codingPath.map { $0.stringValue }.joined(separator: ".")
//                print("DecodingError.dataCorrupted at '\(path)': \(context.debugDescription)")
//            @unknown default:
//                print("DecodingError: \(decodingError)")
//            }
//            onError(ErrorResponse(errors: [ErrorBody(message: decodingError.localizedDescription, code: 400)], responseCode: 400))
//        } catch {
//            print("Unexpected error during JSON decoding: \(error.localizedDescription)")
//            onError(ErrorResponse(errors: [ErrorBody(message: "ERROR", code: 404)], responseCode: 404))
//        }
//    }
//    
//    func decodeJson(for resource: String) -> DeviceDiscoveryResult? {
//        do {
//            if let bundlePath = Bundle.main.path(forResource: resource, ofType: "json"),
//               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//                if let json = try? JSONDecoder().decode(DeviceDiscoveryResult.self, from: jsonData) {
//                    return json
//                } else {
//                    print("JSON ERROR")
//                }
//            }
//        } catch {
//            print(error)
//        }
//
//        return nil
//    }
//}
