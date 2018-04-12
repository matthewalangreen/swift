//
//  GameState.swift
//  RPS
//
//  Created by Matt Green on 4/12/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var result: String {
        switch self {
        case .start:
            return "Game Start..."
        case .win:
            return "You Win!"
        case .lose:
            return "You lost =("
        case .draw:
            return "Tie Game!"
        }
    }
}
