//
//  CaculateViewController.swift
//  NovelReader
//
//  Created by Zj on 2017/9/9.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CaculateViewController: UIViewController {

    
    @IBOutlet weak var param1Field: UITextField!
    @IBOutlet weak var param2Field: UITextField!
    @IBOutlet weak var param3Field: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBind()
    }
    
    func setBind() {

        Observable.combineLatest(param1Field.rx.text.orEmpty, param2Field.rx.text.orEmpty, param3Field.rx.text.orEmpty) {
            param1, param2, param3 -> String in
            let result = (Int(param1) ?? 0) + (Int(param2) ?? 0) + (Int(param3) ?? 0)
            return String(result)
            }.bind(to: resultLabel.rx.text).addDisposableTo(disposeBag)
    }
}
