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
    @IBOutlet var numChoicesUITextField: UITextField!
    @IBOutlet var numGoodChoicesUITextField: UITextField!
    @IBOutlet var numBadChoicesUITextField: UITextField!
    @IBOutlet var currentScoreUITextField: UITextField!
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
        //choiceCountTextLabel.text = String(testChoices.sum())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UI Logic
    func updateUI() {
        currentScoreUITextField.text = String(testChoices.sum)
        numChoicesUITextField.text = String(testChoices.numAllChoices)
        numGoodChoicesUITextField.text = String(testChoices.numGoodChoices)
        numBadChoicesUITextField.text = String(testChoices.numBadChoices)
        updateGauge()
        self.view.setNeedsDisplay()
    }
    
    func updateGauge() {
       // gaugeView.needleValue = CGFloat(gaugeValue)
        gaugeView.needleValue = CGFloat(calculatedGaugeValue())
    }
    

}

