//
//  NetApi.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/5.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation
import Moya

let provider = RxMoyaProvider<NetApi>()

enum NetApi {
  
    case roomList(city: String, p: Int, num: Int)
}

extension NetApi: TargetType {

    var baseURL: URL {
        return URL(string: "http://www.airshe.com/index.php/myapp/")!
    }
    
    var path: String {
        switch self {
        case .roomList:
            return "/index100"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .roomList(city: _, p: _, num: _):
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .roomList(let city, let p, let num):
            return ["city": city, "p": p, "num": num]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        return .request
    }
}
