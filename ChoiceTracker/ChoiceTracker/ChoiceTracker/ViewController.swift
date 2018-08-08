//
//  ViewController.swift
//  ChoiceTracker
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit
import ABGaugeViewKit

class ViewController: UIViewController {
    

    //MARK:- Outlets
    @IBOutlet var choiceCountTextLabel: UITextField!
    @IBOutlet var gaugeView: ABGaugeView!
    
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
        choiceCountTextLabel.text = String(testChoices.sum())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UI Logic
    func updateUI() {
        choiceCountTextLabel.text = String(testChoices.sum())
       // colorCounter()
        updateGauge()
        self.view.setNeedsDisplay()
    }
    
    // change the color of the counter based on value
//    func colorCounter() {
//        if choices. >= 0 {
//           choiceCountTextLabel.textColor = UIColor.green
//        } else {
//           choiceCountTextLabel.textColor = UIColor.red
//        }
//    }
    
    func updateGauge() {
        gaugeView.needleValue = CGFloat(gaugeValue)
    }
    
    
    
    
}

