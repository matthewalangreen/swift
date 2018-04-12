//
//  Sign.swift
//  RPS
//
//  Created by Matt Green on 4/12/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign ==  0 {
        return .rock
    } else if sign ==  1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var value: String {
        switch self {
        case .rock: return "👊🏻"
        case .paper: return "✋🏻"
        case .scissors: return "✌🏻"
        }
    }
    
    func findGameState(_ computerPlay: Sign) -> GameState {
        switch self {
        case .rock:
            if(computerPlay.value == "👊🏻") {
                return GameState.draw
            } else if(computerPlay.value == "✋🏻") {
                return GameState.lose
            } else {
                return GameState.win
            }
        case .paper:
            return GameState.win
        case .scissors:
            return GameState.win
        }
    }
}
