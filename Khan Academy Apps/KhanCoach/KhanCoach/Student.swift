//
//  Student.swift
//  KhanCoach
//
//  Created by Matt Green on 6/20/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class Student: NSObject {
    var name: String
    var percentageComplete: Double?
    var totalTime: Int?
    var courseName: String?
    
    init(name: String, percentageComplete: Double?, totalTime: Int?, courseName: String?) {
        self.name = name
        self.percentageComplete = percentageComplete
        self.totalTime = totalTime
        self.courseName = courseName
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let lastNames = ["Adams", "Burt", "Caldwell", "Deacon", "Edmonds", "Falk", "Gray", "Higgins", "Iverson"]
            let firstNames = ["Amy", "Billy", "Candace", "Daniel", "Eric", "Francine", "Geno", "Harriet", "Ike"]
            
            var idx = arc4random_uniform(UInt32(lastNames.count))
            let randomLastName = lastNames[Int(idx)]
            
            idx = arc4random_uniform(UInt32(firstNames.count))
            let randomFirstName = firstNames[Int(idx)]
            
            let randomName = "\(randomLastName), \(randomFirstName)"
            
            self.init(name: randomName, percentageComplete: 0, totalTime: 0, courseName: "")
            
        } else {
            self.init(name: "", percentageComplete: nil, totalTime: nil, courseName: nil)
        }
    }
}
