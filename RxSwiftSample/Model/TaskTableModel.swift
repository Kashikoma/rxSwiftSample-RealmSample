//
//  TaskTableModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/19.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

class TaskTableModel {
    var isSuccess = false
    let taskItems = Variable<[Item]>([])
    
    func deleteItem(path:Int) {
        isSuccess = TaskTableRepository.init().deleteItem(item: taskItems.value[path])
        self.getItem()
    }
    
    func getItem() {
        let list = TaskTableRepository.init().getItem()
        taskItems.value = list
    }
}
