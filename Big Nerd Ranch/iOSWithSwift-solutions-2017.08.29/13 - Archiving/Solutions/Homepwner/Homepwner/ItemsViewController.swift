// 
//  Copyright © 2017 Big Nerd Ranch
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewItem(_ sender: AnyObject) {
        // Create a new Item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // Insert this new row into the table.
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "ShowItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func tableView(_ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath) {
            // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {
            // If the table view is asking to commit a delete command...
            if editingStyle == .delete {
                let item = itemStore.allItems[indexPath.row]
                
                // Remove the item from the store
                itemStore.removeItem(item)
                
                // Also remove that row from the table view with an animation
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create an instance of UITableViewCell, with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                for: indexPath) as! ItemCell
            
            // Set the text on the cell with the description of the item
            // that is at the nth index of items, where n = row this cell
            // will appear in on the tableview
            let item = itemStore.allItems[indexPath.row]
            
            cell.nameLabel.text = item.name
            cell.serialNumberLabel.text = item.serialNumber
            cell.valueLabel.text = "$\(item.valueInDollars)"
            
            return cell
    }
}
