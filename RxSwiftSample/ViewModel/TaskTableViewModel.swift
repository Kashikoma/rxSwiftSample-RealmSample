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
    
    private let model:TaskTableModel = TaskTableModel()
    var disposeBag = DisposeBag()
    
    var items:Observable<[Item]> {
        return model.taskItems.asObservable().map {
            taskItems in
                return taskItems
        }
    }
    
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
        model.getItem()
    }
    
    func deleteData(path:Int) {
        model.deleteItem(path: path)
    }
}
