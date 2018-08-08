//
//  ChoiceLogic.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation


public func incrementChoice(choice: String) {
    print(" \(choice) choice")
    
    switch choice {
    case "Good":
        choiceCount += 1
    case "Bad":
        choiceCount -= 1
    default:
        print("not a valid choice")
    }
    
}
