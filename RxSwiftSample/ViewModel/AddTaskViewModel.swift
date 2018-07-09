//
//  AddTaskViewModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/20.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RxSwift
import RxCocoa

class AddTaskViewModel {
    
    var title = Variable<String>("")
    
    var isValid:Observable<Bool> {
        return title.asObservable().map {
            param in
                return param.characters.count != 0
        }
    }
    
    
    func addTitleData() {
        let item:Item = Item()
        item.title = self.title.value
        let _ = TaskTableModel.init().saveItem(item: item)
    }
}
