//
//  LoginViewModel.swift
//  NovelReader
//
//  Created by Zj on 2017/9/10.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class LoginViewModel {
    
    func loginLocal(username: String, password: String) -> Driver<String> {
        return Observable.create({ (subscribe) -> Disposable in
            if username == "123456" && password == "123456" {
                let loginModel = LoginModel()
                loginModel.code = "1"
                loginModel.message = "success"
                loginModel.data = ["token" : "this token is local" as AnyObject, "statue" : "0" as AnyObject]
                
                subscribe.onNext(loginModel)
            } else {
                let loginModel = LoginModel()
                loginModel.code = "1"
                loginModel.message = "success"
                loginModel.data = ["token" : "this token is local" as AnyObject, "statue" : "1" as AnyObject]
                
                subscribe.onNext(loginModel)
            }
            subscribe.onCompleted()
            return Disposables.create()
        }).flatMap{ (value: LoginModel) -> Observable<String> in

            print("进行保存token的操作==>\(value.data!["token"]!)")
            let str = "\(value.data!["statue"]!)" == "0" ? "该账号的身份是：管理员" : "该账号的身份是：普通用户"
            return Observable.just(str)
        }.asDriver(onErrorJustReturn: "登陆错误")
    }
}
