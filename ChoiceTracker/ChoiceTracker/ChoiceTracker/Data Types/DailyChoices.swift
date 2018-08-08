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
    
    
}
