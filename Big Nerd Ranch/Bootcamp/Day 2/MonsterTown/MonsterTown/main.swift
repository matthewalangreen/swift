//
//  main.swift
//  MonsterTown
//
//  Created by Matt Green on 6/17/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)
myTown.printDescription()
let genericMonster = Monster()
genericMonster.town = myTown
genericMonster.terrorizeTown()
