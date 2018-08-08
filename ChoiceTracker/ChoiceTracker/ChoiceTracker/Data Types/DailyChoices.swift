//
//  DailyChoices.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

class DailyChoices {
    var choices: [Int] = [0]
    
    func goodChoice() {
        choices.append(1)
    }
    
    func badChoice() {
        choices.append(-1)
    }
    
    func sum() -> Int {
        // add 'em up
        let r = choices.reduce(0, +)
        return r
    }
    
    func numChoices() -> Int {
        let r = choices.count - 1 // there is an initial "0" in the array... don't count that
        return r
    }
    
    func numGoodChoices() -> Int {
        var count = 0
        for item in choices {
            if item == 1 {
                count += 1
            }
        }
        return count
    }
    
    func numBadChoices() -> Int {
        var count = 0
        for item in choices {
            if item == -1 {
                count += 1
            }
        }
        return count
    }
    
//    func percentage() -> Float {
//        let r =
//
//        return r
//    }
    
    
}
