//
//  LoginViewModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/15.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

struct LoginViewModel {
 
    private let model:LoginModel = LoginModel()
    
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var disposeBag = DisposeBag()
    
    func initalize() {
        model.isProcess.asObservable().subscribe(onNext: {process in
            if(process) {
                //プログレスまわす
            } else {
                //まわすのやめる
                self.isCertification.value = self.model.isSuccess
            }
        }).disposed(by: disposeBag)
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(self.username.asObservable(),self.password.asObservable()) {
            (username,password) in
            return username.count > 0 && password.count > 0
        }
    }
    
    var isCertification = Variable<Bool>(false)
    
    //何契機に呼ばれたかはわからないけど、このメソッドでModelのどのメソッドを呼べばよいかは知っている
    //結果をどの変数にセットするかも知っている
    func attemptToLogin() {
        print("username:",username.value)
        print("password:",password.value)
        model.loginRequest(id: username.value, pw: password.value)
    }
}
