//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/12.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTextField.rx.text.orEmpty.bind(to: viewModel.username).disposed(by: disposeBag)
        passwordTextFiled.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: disposeBag)
        
        viewModel.isValid.map{ $0 }.bind(to: confirmButton.rx.isEnabled).disposed(by: disposeBag)
        
        confirmButton.rx.tap.subscribe(onNext:{[weak self] _ in
            self?.viewModel.attemptToLogin()
        }).disposed(by: disposeBag)
        
        viewModel.isCertification.asObservable().subscribe(onNext: {newValue in
            if(newValue) {
                let nextVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TaskTableView") as UIViewController
                nextVc.modalTransitionStyle = .flipHorizontal
                self.present(nextVc,animated: true,completion: nil)
            }
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

