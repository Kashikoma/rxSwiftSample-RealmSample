//
//  AddTaskViewModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/20.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

struct AddTaskViewModel {
    
    let model:AddTaskModel = AddTaskModel()
    
    var title = Variable<String>("")
    
    var isValid:Observable<Bool> {
        return title.asObservable().map {
            param in
                return param.count != 0
        }
    }
    
    
    func addTitleData() {
        model.addTitleData(title: title.value)
    }
}
