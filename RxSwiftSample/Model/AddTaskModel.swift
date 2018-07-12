//
//  AddTaskModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/07/12.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

class AddTaskModel {
    let isSuccess = Variable<Bool>(false)
    
    func addTitleData(title:String) {
        let item:Item = Item()
        item.title = title
        isSuccess.value = AddTaskRepository.init().saveItem(item: item)
    }
}
