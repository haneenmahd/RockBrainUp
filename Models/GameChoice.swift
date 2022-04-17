//
//  GameChoice.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import Foundation

enum GameChoice {
    case rock, paper, scissors
    
    static func pickRandom() -> GameChoice {
        let choices: [GameChoice] = [.rock, .paper, .scissors].shuffled()
        let randomIndex = Int.random(in: 0..<choices.count)
        let randomChoice = choices[randomIndex]
        
        return randomChoice
    }
    
    static func fromString(_ str: String) -> GameChoice {
        let lowercasedString = str.lowercased().trimmingCharacters(in: .whitespaces)
        
        switch lowercasedString {
        case "🪨":
            return .rock
            
        case "📄":
            return .paper
        
        case "✂️":
            return .scissors
        
        default:
            return .rock
        }
    }
    
    func toString() -> String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📄"
        case .scissors:
            return "✂️"
        }
    }
}
