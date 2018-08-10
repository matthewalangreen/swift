//
//  ChoiceData.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

// keep track of choices. "-1" for bad choice "1" for good choice
// this would be a great format if it works!
//var dataDictionary: Dictionary = [Date:DailyChoices]()
//let today = Date.init()
//let todaysChoices = DailyChoices()
//dataDictionary[today] = todaysChoices.init()
//var testChoices = DailyChoices()

class ChoiceData {
    
    var allChoices: [DailyChoices] = []
    
    let choicesArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("DailyChoices.archive")
    }()
    
    // methods
    func saveChages() -> Bool {
        print("saving items to \(choicesArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allChoices, toFile: choicesArchiveURL.path)
    }
}


