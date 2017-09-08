
//
//  Protocol.swift
//  NovelReader
//
//  Created by 张骏 on 2017/9/8.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//面向协议
//各种结果

enum Reslut {
    case success(msg: String)
    case fail(error: String)
}

extension Reslut {
    var isValid: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
}
