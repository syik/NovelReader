//
//  LoginViewController.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/7.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var Account: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var AccountStatus: UILabel!
    @IBOutlet weak var PasswordStatus: UILabel!
    @IBOutlet weak var ResultStauts: UILabel!
    
    let disposeBag = DisposeBag()
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Login.rx.tap.subscribe { _ in
            
            self.loginViewModel.loginLocal(username: self.Account.text!, password: self.Password.text!).drive(self.ResultStauts.rx.text).addDisposableTo(self.disposeBag)
        }.addDisposableTo(disposeBag)
    }

    
}
