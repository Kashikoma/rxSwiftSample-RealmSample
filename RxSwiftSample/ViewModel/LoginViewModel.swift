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
    
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(self.username.asObservable(),self.password.asObservable()) {
            (username,password) in
            return username.characters.count > 0 && password.characters.count > 0
        }
    }
    
    var isCertification = Variable<Bool>(false)

    
    func attemptToLogin() {
        print("username:",username.value)
        print("password:",password.value)
        isCertification.value = true
    }
}
