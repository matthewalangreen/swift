//
//  ChoiceGauge.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

var gaugeValue: Int = 50

func calculatedGaugeValue() -> Int {
    let amount = Int(testChoices.choicePercentage * 100)
    return amount
}
