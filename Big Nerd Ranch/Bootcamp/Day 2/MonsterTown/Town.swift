//
//  Town.swift
//  MonsterTown
//
//  Created by Matt Green on 6/17/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

struct Town {
    var population = 5_422
    var numberOfStoplights = 4
    
    func printDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
