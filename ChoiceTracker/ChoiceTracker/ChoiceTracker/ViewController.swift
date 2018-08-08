//
//  ViewController.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var choiceCountTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //choiceCountTextLabel.text = "Hi"
        choiceCountTextLabel.text = String(choiceCount)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addGoodChoice(_ sender: Any) {
        incrementChoice(choice: "Good")
        choiceCountTextLabel.text = String(choiceCount)
        self.view.setNeedsDisplay()
    }
    
    @IBAction func addBadChoice(_ sender: Any) {
        incrementChoice(choice: "Bad")
        choiceCountTextLabel.text = String(choiceCount)
        self.view.setNeedsDisplay()
    }
}

