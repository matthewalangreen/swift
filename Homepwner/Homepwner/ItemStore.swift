//
//  ItemStore.swift
//  Homepwner
//
//  Created by Matt Green on 3/23/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    // remove items. duh
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    // puts five random objects into the store
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }

}




