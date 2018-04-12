//
//  ViewController.swift
//  RPS
//
//  Created by Matt Green on 4/12/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var robotSign: UILabel!
    @IBOutlet var gameStatus: UILabel!
    @IBOutlet var rockButtonLabel: UIButton!
    @IBOutlet var paperButtonLabel: UIButton!
    @IBOutlet var scissorsButtonLabel: UIButton!
    @IBOutlet var playAgainButtonLabel: UIButton!
    
    @IBAction func rockButtonPressed(_ sender: Any) {
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
    }
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        updateUI(gameState: gameState)
    }
    
    var gameState = GameState.start
    
    func updateUI(gameState: GameState) {
        gameStatus.text = gameState.result
        switch gameState {
        case .start:
            view.backgroundColor = UIColor.black
            robotSign.text = "🤖"
            playAgainButtonLabel.isHidden = true
            
            rockButtonLabel.isEnabled = true
            paperButtonLabel.isEnabled = true
            scissorsButtonLabel.isEnabled = true
            
            rockButtonLabel.isHidden = false
            paperButtonLabel.isEnabled = false
            scissorsButtonLabel.isEnabled = false
        default:
            print("All we know is that the game has started")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(gameState: gameState)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

