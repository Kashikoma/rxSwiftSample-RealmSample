//
//  TaskTableModel.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/19.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import Foundation
import RealmSwift

class TaskTableModel {
    //TODO エラー処理実装
    //TODO 暗号化処理
    
    func saveItem(item:Item) -> Bool {
        let realm = try! Realm()
        try! realm.write() {
            item.setNewId()
            realm.add(item)
        }
        return true
    }
    
    func deleteItem(item:Item) -> Bool {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(item)
        }
        return true
    }
    
    func updateItem(item:Item) -> Bool {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(item, update: true)
        }
        return true
    }
    
    func getItem() -> [Item] {
        let realm = try! Realm()
        let items = realm.objects(Item.self)
        return Array(items)
    }
}
