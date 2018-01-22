//
//  TestModel.swift
//  HCModel
//
//  Created by hucong on 2018/1/22.
//  Copyright © 2018年 hucong. All rights reserved.
//

import Foundation

class FirstModel: Codable {
    var success = false
    var errorMsg = ""
    var content: SecondModel?
}

class SecondModel: Codable {
    var title = ""
    var count = 0
    var time = 0.0
    var childs: [ThirdModel]?
}

class ThirdModel: Codable {
    var name = ""
    var age = 0
}
