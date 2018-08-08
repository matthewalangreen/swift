//
//  ViewController.swift
//  GuageViewDemo
//
//  Created by Matt Green on 8/8/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit
import ABGaugeViewKit

class ViewController: UIViewController {
    var gaugeValue: Int = 0;

    @IBOutlet var myGauge: ABGaugeView!
    
    @IBOutlet var guageLabel: UILabel!
    
    
    @IBAction func plusButton(_ sender: Any) {
        gaugeValue += 5
        updateDisplay()
    }
    
    @IBAction func minusButton(_ sender: Any) {
        gaugeValue -= 5
        updateDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myGauge.needleValue = CGFloat(gaugeValue)
        guageLabel.text = String(gaugeValue)
        self.view.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisplay() {
        myGauge.needleValue = CGFloat(gaugeValue)
        guageLabel.text = String(gaugeValue)
        self.view.setNeedsDisplay()
    }


}

