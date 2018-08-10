//
//  DailyRecordStore.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/9/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class DailyRecordStore {
    //MARK:- Properties
    var allDailyRecords: Dictionary = [String:DailyRecord]()
    
    let recordsArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("dailyRecords.archive")
    }()
    
    //MARK:- Initializer
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: recordsArchiveURL.path) as? [String:DailyRecord] {
            allDailyRecords = archivedItems
        }
    }
    
    //Mark:- Methods
    
    @discardableResult func createDailyRecord() -> DailyRecord {
        let newDailyRecord = DailyRecord()
        
        // make dateFormatter a reusable closure
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        // end dateFormatter
        
        let nowDateString = dateFormatter.string(from: Date.init())
        
        allDailyRecords[nowDateString] = newDailyRecord
        
        return newDailyRecord
    }
    
    func doesDateExistQ(date: String) -> Bool {
        return allDailyRecords.keys.contains(date)
    }
    
    //MARK:-Start here -- work to implement this function so we can always get the correct day's data
    func getCurrentDayRecord() -> DailyRecord {
        // check allDailyRecords for today, if today exists return
        
        // if today doesn't exist, make it and return it.
        return createDailyRecord()
    }
    
  
    
    //MARK:- NSCoding Methods
    func saveChanges() -> Bool {
        print("Saving items to: \(recordsArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allDailyRecords, toFile: recordsArchiveURL.path)
    }
}
