//
//  LoginModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/07/10.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

class LoginModel {
    var isProcess = Variable<Bool>(false)
    var isSuccess = false
    var resultMessage = ""
    
    func loginRequest(id:String,pw:String){
        isProcess.value = true
        let repository = LoginRepository()
        let result = repository.transactionLogin(id:id,pw:pw)
        isSuccess = result.isSuccess
        resultMessage = result.resultMessage
        isProcess.value = false
    }
}
