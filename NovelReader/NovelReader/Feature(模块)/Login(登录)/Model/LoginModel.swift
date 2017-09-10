
//
//  LoginModel.swift
//  NovelReader
//
//  Created by Zj on 2017/9/10.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation
import HandyJSON

class LoginModel: HandyJSON {
    
    var code: String?
    var message: String?
    var data: [String : AnyObject]?
    
    required init() {
        
    }
}
