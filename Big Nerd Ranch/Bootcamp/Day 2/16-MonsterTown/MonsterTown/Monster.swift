//
//  Monster.swift
//  MonsterTown
//
//  Created by Matt Green on 6/17/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
