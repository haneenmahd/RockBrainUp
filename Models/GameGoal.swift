//
//  GameGoal.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import Foundation

enum GameGoal {
    case win, lose
    
    static func pickRandom() -> GameGoal {
        let goals: [GameGoal] = [.win, .lose].shuffled()
        let randomIndex = Int.random(in: 0..<goals.count)
        let randomGoal = goals[randomIndex]
        
        return randomGoal
    }
    
    static func fromString(_ str: String) -> GameGoal {
        let lowercasedString = str.lowercased().trimmingCharacters(in: .whitespaces)
        
        switch lowercasedString {
        case "win":
            return .win
        case "lose":
            return .lose
            
        default:
            return .win
        }
    }
    
    func toString() -> String {
        switch self {
        case .win:
            return "win"
        case .lose:
            return "lose"
        }
    }
}
