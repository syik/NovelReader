//
//  TimeViewController.swift
//  NovelReader
//
//  Created by 张骏 on 17/9/7.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TimeViewController: UIViewController {

    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var TimeLabel2: UILabel!
    @IBOutlet weak var GetBtn: UIButton!
    
    fileprivate let disposeBag = DisposeBag()
    
    var timeViewModel: TimeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setup1()
        
        //setup2()
    
        //setup3()
    
        setupMVVM()
    }

    func setupMVVM() {
        
        timeViewModel = TimeViewModel()
        
        let input = TimeViewModel.input(timeBtnClicked: GetBtn.rx.tap.asDriver())
        let output = timeViewModel?.transform(input: input)
        
        output?.time.drive(TimeLabel.rx.text).addDisposableTo(disposeBag)
        output?.time.drive(TimeLabel2.rx.text).addDisposableTo(disposeBag)
    }
    
    func setup1() {
    
        GetBtn.rx.tap.subscribe({
            [weak self] _ in
            guard let this = self else {
                return
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let date = formatter.string(from: Date())
            this.TimeLabel.text = date
        }).addDisposableTo(disposeBag)
    }
    
    func setup2() {
        
        GetBtn.rx.tap.map(getTime).bind(to: TimeLabel.rx.text).addDisposableTo(disposeBag)
    }
    
    func setup3() {
        
        //let signal = GetBtn.rx.tap.map(getTime).shareReplayLatestWhileConnected()
        
        //signal.bind(to: TimeLabel.rx.text).addDisposableTo(disposeBag)
        //signal.bind(to: TimeLabel2.rx.text).addDisposableTo(disposeBag)
        
        let signal = GetBtn.rx.tap.asDriver().map(getTime)
    
        signal.drive(TimeLabel.rx.text).addDisposableTo(disposeBag)
        signal.drive(TimeLabel2.rx.text).addDisposableTo(disposeBag)
    }
    
    func getTime() -> String {
        print("getTime")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.string(from: Date())
        
        return date
    }
}
