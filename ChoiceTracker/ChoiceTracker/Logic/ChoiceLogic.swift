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
        //choices.append(1)
        testChoices.goodChoice()
        gaugeValue += 5
    case "Bad":
        //choices.append(-1)
        testChoices.badChoice()
        gaugeValue -= 5
    default:
        print("not a valid choice")
    }
    
}
