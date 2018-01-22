//
//  ViewController.swift
//  HCModel
//
//  Created by hucong on 2018/1/22.
//  Copyright © 2018年 hucong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dic: [String: Any] = ["success": true,
                   "errorMsg": "",
                   "content": ["title": "标题", "count": 10, "time": 234324.1, "childs": [["name": "child1", "age": 10], ["name": "child2", "age": 20]]]]
        
        let model = FirstModel.hc_model(with: dic)
        print(model?.success ?? false)
        print(model?.content?.count ?? 0)
        print(model?.content?.childs?[0].name ?? "")
    }
}

