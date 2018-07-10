//
//  LoginRepository.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/07/10.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//


class LoginRepository {
    func transactionLogin(id:String,pw:String) -> LoginResult {
        return LoginResult(isSuccess: true, resultMessage: "ログインに成功しました")
    }
}
