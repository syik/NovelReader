//
//  ViewModelType.swift
//  NovelReader
//
//  Created by 张骏 on 2017/9/8.
//  Copyright © 2017年 Zj. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype input
    associatedtype output
    
    func transform(input: input) -> output
}
