//
//  Item.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/18.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import RealmSwift

class Item : Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var title:String = "nil"
    
    func setNewId() {
        id = createNewId()
    }
    
    // idをプライマリキーに設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // 新しいIDを採番します。
    private func createNewId() -> Int {
        let realm = try! Realm()
        return (realm.objects(type(of: self).self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
    }
}
