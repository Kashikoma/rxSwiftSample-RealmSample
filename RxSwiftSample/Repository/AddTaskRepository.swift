//
//  AddTaskRepository.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/07/12.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RealmSwift

class AddTaskRepository {
    func saveItem(item:Item) -> Bool {
        let realm = try! Realm()
        try! realm.write() {
            item.setNewId()
            realm.add(item)
        }
        return true
    }
}
