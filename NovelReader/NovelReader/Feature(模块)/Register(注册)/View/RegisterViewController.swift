//
//  RegisterViewController.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/7.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    @IBOutlet weak var Account: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var PasswordRepeat: UITextField!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var AccountStatus: UILabel!
    @IBOutlet weak var PasswordStatus: UILabel!
    @IBOutlet weak var PasswordRepeatStatus: UILabel!
    
    let registerViewModel = RegisterViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBind()
    }
   
    func setupBind() {
        
        Account.rx.text.orEmpty
            .bind(to: registerViewModel.account)
            .addDisposableTo(disposeBag)
        
        //registerViewModel.accountValid.bind(to: accountService.validateRepeat(<#T##accountService#>))
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self .dismiss(animated: true, completion: nil)
    }
}
