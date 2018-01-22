//
//  HCModel.swift
//  swiftModel swift4.0及以上使用的字典转模型，使用方法，模型(类、结构体、枚举)仅须遵守Codable协议即可，
//
//  Created by hucong on 2018/1/22.
//  Copyright © 2018年 hucong. All rights reserved.
//

import Foundation

extension Decodable {
    
    /// 字典转模型
    ///
    /// - Parameter keyAndValues: 字典
    /// - Returns: 模型对象
    static func hc_model(with keyAndValues: [String: Any]) -> Self? {
        return keyAndValues.to(self)
    }
    
    /// json字符串转模型
    ///
    /// - Parameter JSONString: json字符串
    /// - Returns: 模型对象
    static func hc_model(with JSONString: String) -> Self? {
        return JSONString.to(self)
    }
    
    /// json二进制数据(Data)转模型
    ///
    /// - Parameter JSONData: json数据
    /// - Returns: 模型对象
    static func hc_model(with JSONData: Data) -> Self? {
        return JSONData.to(self)
    }
}

extension Encodable {
    
    /// 模型对象转json字符串
    ///
    /// - Returns: json字符串
    func toJSON() -> String {
        do {
            let data = try? JSONEncoder().encode(self)
            guard let jsonData = data else { return "" }
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString ?? ""
        }
    }
    
    /// 模型对象转字典
    ///
    /// - Returns: 字典
    func toDictionary() -> [String: Any]? {
        do {
            let data = try? JSONEncoder().encode(self)
            guard let jsonData = data else { return nil }
            let jsonDic = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? [String: Any]
            return jsonDic
        }
    }
}

extension Dictionary {
    func to<T: Decodable>(_ modelType: T.Type) -> T? {
        do {
            let data = try? JSONSerialization.data(withJSONObject: self, options: [])
            guard let jsonData = data else { return nil }
            let modelObj = try? JSONDecoder().decode(modelType, from: jsonData)
            return modelObj
        }
    }
}

extension String {
    func to<T: Decodable>(_ modelType: T.Type) -> T? {
        do {
            if !self.isValidJSONString() {
                return nil
            }
            let data = self.data(using: .utf8)
            guard let jsonData = data else { return nil }
            let modelObj = try? JSONDecoder().decode(modelType, from: jsonData)
            return modelObj
        }
    }
    
    func isValidJSONString() -> Bool {
        do {
            let data = self.data(using: .utf8)
            guard let jsonData = data else { return false }
            let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            if jsonObj == nil {
                return false
            }
            return true
        }
    }
}

extension Data {
    func to<T: Decodable>(_ modelType: T.Type) -> T? {
        if !self.isValidJSONData() {
            return nil
        }
        do {
            let modelObj = try? JSONDecoder().decode(modelType, from: self)
            return modelObj
        }
    }
    
    func isValidJSONData() -> Bool {
        do {
            let jsonObj = try? JSONSerialization.jsonObject(with: self, options: [])
            if jsonObj == nil {
                return false
            }
            return true
        }
    }
}
