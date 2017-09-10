//
//  RegisterViewModel.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/7.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewModel {

    //input
    let account = Variable<String>("")
    
    //output
    let accountValid: Observable<Reslut>
    
    init() {
        
        let service = accountService.instance
        
        accountValid = account.asObservable().flatMapLatest{
            account in return service.validateAccount(account: account).observeOn(MainScheduler.instance).catchErrorJustReturn(.fail(error: "error"))
        }.shareReplay(1)
    }
}
