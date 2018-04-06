//
//  TagsViewController.swift
//  Photorama
//
//  Created by Matt Green on 4/5/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit
import CoreData

class TagsViewController: UITableViewController {
    var store: PhotoStore!
    var photo: Photo!
    
    var selectedIndexPaths = [IndexPath]()
    
    let tagDataSource = TagDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tagDataSource
    
        updateTags()
    }
    
    func updateTags() {
        store.fetchAllTags {
        (tagsResult) in
        
        switch tagsResult {
        case let .success(tags):
            self.tagDataSource.tags = tags
        case let .failure(error):
            print("Error fetching tags: \(error).")
        }
        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
}














