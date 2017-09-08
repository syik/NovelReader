//
//  RegisterViewController.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/7.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var Account: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var PasswordRepeat: UITextField!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var AccountStatus: UILabel!
    @IBOutlet weak var PasswordStatus: UILabel!
    @IBOutlet weak var PasswordRepeatStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self .dismiss(animated: true, completion: nil)
    }
}
