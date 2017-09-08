
//
//  TimeViewModel.swift
//  NovelReader
//
//  Created by 张骏 on 2017/9/8.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class TimeViewModel: ViewModelType {

    func transform(input: input) -> output {
    
        func getTime() -> String {
            print("getTime")
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formatter.string(from: Date())
            
            return date
        }
        let time = input.timeBtnClicked.map(getTime)
        return output(time: time)
    }
}

extension TimeViewModel {

    struct input {
        let timeBtnClicked: Driver<Void>
    }
    
    struct output {
        let time: Driver<String>
    }
}
