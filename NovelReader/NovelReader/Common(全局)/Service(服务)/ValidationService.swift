//
//  ValidationService.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/7.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//注册页面测试
class accountService {
    
    static let instance = accountService()
    
    private init() {}

    //检测格式
    func validateAccount(account: String) -> Observable<Reslut> {
        
        if account.characters.count == 0 {
            return .just(.fail(error: "账号不为空"))
        }
        
        if account.characters.count < 6 {
            return .just(.fail(error: "号码长度至少6个字符"))
        }
        
        return .just(.success(msg: "用户名可用"))
    }
    
    //检测本地数据
    func validateRepeat(account: String) -> Bool {
        let filePath = NSHomeDirectory() + "/users.plist"
        let userDic = NSDictionary(contentsOfFile: filePath)
        let userArray = userDic?.allKeys as! NSArray
        return userArray.contains(account)
    }
}


