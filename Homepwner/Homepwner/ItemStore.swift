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
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // get reference to object being moved so we can reinsert it
        let movedItem = allItems[fromIndex]
        
        // remove item from the array
        allItems.remove(at: fromIndex)
        
        // insert item at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    // puts five random objects into the store
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }

}















