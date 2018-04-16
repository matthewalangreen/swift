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
        play(sign: .rock)
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(sign: .paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(sign: .scissors)
    }
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        updateUI(gameState: gameState)
    }
    
    var gameState = GameState.start
    
    func play(sign: Sign) {
       let computerPlay = randomSign()
       let result = sign.findGameState(computerPlay)
       robotSign.text = computerPlay.value
       gameStatus.text = result.result
        
        rockButtonLabel.isEnabled = false
        paperButtonLabel.isEnabled = false
        scissorsButtonLabel.isEnabled = false
        
        // hide all the buttons except for the one that player tapped
        if sign.value == "👊🏻" {
            paperButtonLabel.isHidden = true;
            scissorsButtonLabel.isHidden = true;
        } else if sign.value == "✋🏻" {
            rockButtonLabel.isHidden = true;
            scissorsButtonLabel.isHidden = true;
        } else {
            rockButtonLabel.isHidden = true;
            paperButtonLabel.isHidden = true;
        }
        
         playAgainButtonLabel.isHidden = false
       // gameState = result
    }
    
    func updateUI(gameState: GameState) {
        gameStatus.text = gameState.result
        switch gameState {
        case .start:
            view.backgroundColor = UIColor.white
            robotSign.text = "🤖"
            playAgainButtonLabel.isHidden = true
            
            rockButtonLabel.isEnabled = true
            paperButtonLabel.isEnabled = true
            scissorsButtonLabel.isEnabled = true
            
            rockButtonLabel.isHidden = false
            paperButtonLabel.isHidden = false
            scissorsButtonLabel.isHidden = false
        case .win:
            view.backgroundColor = UIColor.green
            //robotSign.text = "🤖"
            playAgainButtonLabel.isHidden = true
            
            rockButtonLabel.isEnabled = true
            paperButtonLabel.isEnabled = true
            scissorsButtonLabel.isEnabled = true
            
            rockButtonLabel.isHidden = false
            paperButtonLabel.isEnabled = false
            scissorsButtonLabel.isEnabled = false
        case .lose:
            view.backgroundColor = UIColor.red
            //robotSign.text = "🤖"
            playAgainButtonLabel.isHidden = true
            
            rockButtonLabel.isEnabled = true
            paperButtonLabel.isEnabled = true
            scissorsButtonLabel.isEnabled = true
            
            rockButtonLabel.isHidden = false
            paperButtonLabel.isEnabled = false
            scissorsButtonLabel.isEnabled = false
        case .draw:
            view.backgroundColor = UIColor.white
            //robotSign.text = "🤖"
            playAgainButtonLabel.isHidden = true
            
            rockButtonLabel.isEnabled = true
            paperButtonLabel.isEnabled = true
            scissorsButtonLabel.isEnabled = true
            
            rockButtonLabel.isHidden = false
            paperButtonLabel.isEnabled = false
            scissorsButtonLabel.isEnabled = false
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

