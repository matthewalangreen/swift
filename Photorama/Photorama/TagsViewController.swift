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
        tableView.delegate = self
    
        updateTags()
    }
    
    func updateTags() {
        store.fetchAllTags {
        (tagsResult) in
        
        switch tagsResult {
        case let .success(tags):
            self.tagDataSource.tags = tags
            
            guard let photoTags = self.photo.tags as? Set<Tag> else {
                return
            }
            
            for tag in photoTags {
                if let index = self.tagDataSource.tags.index(of: tag) {
                    let indexPath = IndexPath (row: index, section: 0)
                    self.selectedIndexPaths.append(indexPath)
                }
            }
        case let .failure(error):
            print("Error fetching tags: \(error).")
        }
        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag =  tagDataSource.tags[indexPath.row]
        
        if let index = selectedIndexPaths.index(of: indexPath) {
            selectedIndexPaths.remove(at: index)
            photo.removeFromTags(tag)
        } else {
            selectedIndexPaths.append(indexPath)
            photo.addToTags(tag)
        }
        
        do {
            try store.persistentContainer.viewContext.save()
        } catch {
            print("Core data save failed \(error)")
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if selectedIndexPaths.index(of: indexPath) != nil {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}














