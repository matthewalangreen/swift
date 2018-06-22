// 
//  Copyright © 2017 Big Nerd Ranch
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create a new Item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // Insert this new row into the table.
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    
    override func tableView(_ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath) {
            // Update the model
        
        // MARK: - Gold Challenge
        // MARK: -
        
        // catch the possibility that we move a row below the last row.
        if destinationIndexPath.row >= itemStore.allItems.count {
            // Do nothing
        } else {
            itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        }
    }
    
    
    
    // MARK: - Bronze challenge
    //Change label of delete button to "Remove"
    // MARK: -
    
    // override the function to see if we can edit a row
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == itemStore.allItems.count {
            return false
        } else {
            return true
        }
    }

    override func tableView(_ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {
            // If the table view is asking to commit a delete command...
            if editingStyle == .delete {
                if(indexPath.row == itemStore.allItems.count) {
                   // do nothing
                }
                
                else
                {
                    let item = itemStore.allItems[indexPath.row]
                    
                    let title = "Delete \(item.name)?"
                    let message = "Are you sure you want to delete this item?"
                    
                    let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    ac.addAction(cancelAction)
                    
                    let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                        
                        // Remove the item from the store
                        self.itemStore.removeItem(item)
                        
                        // Also remove that row from the table view with an animation
                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    })
                   ac.addAction(deleteAction)
                    
                    //present the alert controller
                    present(ac, animated: true, completion: nil)
                }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count + 1 // add one for the new row I'm going to add
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create an instance of UITableViewCell, with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                for: indexPath) as! ItemCell
            
            // Set the text on the cell with the description of the item
            // that is at the nth index of items, where n = row this cell
            // will appear in on the tableview
       
        // MARK: -
        // MARK: Silver Challenge
        // Mark: -
        if indexPath.row == itemStore.allItems.count {
            cell.nameLabel.text = "No more items!"
            cell.serialNumberLabel.text = ""
            cell.valueLabel.text = ""
            
            
        } else {
        
            let item = itemStore.allItems[indexPath.row]
            
            cell.nameLabel.text = item.name
            cell.serialNumberLabel.text = item.serialNumber
            cell.valueLabel.text = "$\(item.valueInDollars)"
        }
            return cell
    }
}
