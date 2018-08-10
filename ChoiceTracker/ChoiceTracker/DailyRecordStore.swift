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
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    //MARK:- Initializer
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: recordsArchiveURL.path) as? [String:DailyRecord] {
            allDailyRecords = archivedItems
        }
    }
    
    //Mark:- Methods
    func generateRandomDate(daysBack: Int)-> Date?{
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = Int(day - 1)
        offsetComponents.hour = Int(hour)
        offsetComponents.minute = Int(minute)
        
        let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0) )
        return randomDate
    }
    
    @discardableResult func createRandomDailyRecord() -> DailyRecord {
        let n = Int(arc4random_uniform(50)) // random number  0 - 49
        let newDailyRecord = DailyRecord()
        let nowDateString = dateFormatter.string(from: generateRandomDate(daysBack: n)!)
        allDailyRecords[nowDateString] = newDailyRecord
        return newDailyRecord
    }
    
    @discardableResult func createDailyRecord() -> DailyRecord {
        let newDailyRecord = DailyRecord()
        let nowDateString = dateFormatter.string(from: Date.init())
        allDailyRecords[nowDateString] = newDailyRecord
        return newDailyRecord
    }
    
    //MARK:- NSCoding Methods
    func saveChanges() -> Bool {
        print("Saving items to: \(recordsArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allDailyRecords, toFile: recordsArchiveURL.path)
    }
}
