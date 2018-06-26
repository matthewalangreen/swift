//
//  Town.swift
//  MonsterTown
//
//  Created by Matt Green on 6/17/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

struct Town {
    let region = "South"
    var population = 5_422
    var numberOfStoplights = 4
    
    enum Size {
        case small, medium, large
    }
    
    lazy var townSize: Size = {
        switch self.population {
        case 0...10_000:
            return Size.small
        case 10_001...100_000:
            return Size.medium
        default:
            return Size.large
        }
    }()
    
    func printDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
