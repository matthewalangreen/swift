//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Matt Green on 4/11/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let meowSound = SimpleSound(named: "meow")
    let woofSound = SimpleSound(named: "woof")
    let mooSound = SimpleSound(named: "moo")
   
    @IBAction func catButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Meow!"
        meowSound.play()
    }
    @IBAction func dogButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Bork!"
        woofSound.play()
    }
    @IBAction func cowButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Mooo!"
        mooSound.play()
    }
    
    @IBOutlet var animalSoundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

