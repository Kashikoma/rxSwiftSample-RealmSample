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
 
    private let loginModel:LoginModel = LoginModel()
    
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var disposeBag = DisposeBag()
    
    func initalize() {
        loginModel.isProcess.asObservable().subscribe(onNext: {process in
            if(process) {
                //プログレスまわす
            } else {
                //まわすのやめる
                self.isCertification.value = self.loginModel.isSuccess
            }
        }).disposed(by: disposeBag)
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(self.username.asObservable(),self.password.asObservable()) {
            (username,password) in
            return username.characters.count > 0 && password.characters.count > 0
        }
    }
    
    var isCertification = Variable<Bool>(false)
    
    //何契機に呼ばれたかはわからないけど、このメソッドでRepositoryのどのメソッドを呼べばよいかは知っている
    //結果をどの変数にセットするかも知っている
    func attemptToLogin() {
        print("username:",username.value)
        print("password:",password.value)
        loginModel.isProcess.value = true
        loginModel.loginRequest(id: username.value, pw: password.value)
    }
}
