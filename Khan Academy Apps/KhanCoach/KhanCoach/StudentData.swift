//
//  StudentData.swift
//  KhanCoach
//
//  Created by Matt Green on 6/20/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class StudentData {
    
    var allStudents = [Student]()
    
    @discardableResult func createStuent() -> Student {
        let newStudent = Student(random: true)
        
        allStudents.append(newStudent)
        
        return newStudent
    }
    
    init() {
        for _ in 0..<50 {
            createStuent()
        }
    }
}
