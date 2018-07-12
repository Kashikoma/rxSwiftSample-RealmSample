//
//  TaskTableRepository.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/07/11.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RealmSwift

class TaskTableRepository {
    
    //TODO 論理削除
    func deleteItem(item:Item) -> Bool {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(item)
        }
        return true
    }
    
    func getItem() -> [Item] {
        let realm = try! Realm()
        let items = realm.objects(Item.self)
        return Array(items)
    }
}
