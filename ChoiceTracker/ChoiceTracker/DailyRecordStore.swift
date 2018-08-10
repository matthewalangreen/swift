//
//  DailyRecordStore.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/9/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class DailyRecordStore {
    var allDailyRecords = [DailyRecord]()
    
    let recordsArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("dailyRecords.archive")
    }()
    
    @discardableResult func createDailyRecord() -> DailyRecord {
        let newDailyRecord = DailyRecord()
        
        allDailyRecords.append(newDailyRecord)
        
        return newDailyRecord
    }
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: recordsArchiveURL.path) as? [DailyRecord] {
            allDailyRecords = archivedItems
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(recordsArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allDailyRecords, toFile: recordsArchiveURL.path)
    }
}
