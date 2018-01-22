# HCModel
swift4.0字典转模型框架，使用JSONDecoder实现。

```
//模型类
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

```

```
//用法
let dic: [String: Any] = ["success": true,
                   "errorMsg": "",
                   "content": ["title": "标题", "count": 10, "time": 234324.1, "childs": [["name": "child1", "age": 10], ["name": "child2", "age": 20]]]]
        
        let model = FirstModel.hc_model(with: dic)
        print(model?.success ?? false)
        print(model?.content?.count ?? 0)
        print(model?.content?.childs?[0].name ?? "")
```
