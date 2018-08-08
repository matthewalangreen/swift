//
//  ViewController.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet var choiceCountTextLabel: UITextField!
    
    //MARK:- Actions
    @IBAction func addGoodChoice(_ sender: Any) {
        incrementChoice(choice: "Good")
        updateUI()
    }
    
    @IBAction func addBadChoice(_ sender: Any) {
        incrementChoice(choice: "Bad")
        updateUI()
    }
    
    //MARK:- Template
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        choiceCountTextLabel.text = String(choiceCount)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UI Logic
    func updateUI() {
        choiceCountTextLabel.text = String(choiceCount)
        colorCounter()
        self.view.setNeedsDisplay()
    }
    
    func colorCounter() {
        if choiceCount >= 0 {
           choiceCountTextLabel.textColor = UIColor.green
        } else {
           choiceCountTextLabel.textColor = UIColor.red
        }
    }
    
}

