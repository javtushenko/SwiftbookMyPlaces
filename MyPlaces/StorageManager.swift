//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Николай Явтушенко on 12.01.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
        
    }
    
}
