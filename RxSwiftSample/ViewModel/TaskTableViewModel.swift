//
//  TaskTableViewModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/18.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

struct TaskTableViewModel {
    
    let items = Variable<[Item]>([])
    
    var isEdit: Observable<Bool> {
        return Observable.combineLatest(self.items.asObservable(),self.editBtnStr.asObservable()) {
            itemList,btnStr in
                return itemList.count != 0 || (itemList.count == 0 && btnStr == "完了")
        }
    }
    
    var isEditMode:Observable<Bool> {
        return editBtnStr.asObservable().map {
            x in
                return x == "完了"
        }
    }
    
    var editBtnStr = Variable<String>("編集")
    
    func clickEditBtn() {
        if(editBtnStr.value == "編集") {
            editBtnStr.value = "完了"
        } else {
            editBtnStr.value = "編集"
        }
    }
    
    func reloadData() {
        let model:TaskTableModel = TaskTableModel()
        let list = model.getItem()
        self.items.value = list
    }
    
    func deleteData(path:Int) {
        let _ :Bool = TaskTableModel.init().deleteItem(item: items.value[path])
    }
}
