//
//  StudentsViewController.swift
//  KhanCoach
//
//  Created by Matt Green on 6/20/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class StudentsViewController: UITableViewController {
    var studentData: StudentData!
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return studentData.allStudents.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // set the text on the cell with the name of the student
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let student = studentData.allStudents[indexPath.row]
        
        // show student name
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    
}
