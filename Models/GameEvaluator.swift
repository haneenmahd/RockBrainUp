//
//  GameEvaluator.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import Foundation

struct GameEvaluator {
    static func correctAnswer(choice: GameChoice, goal: GameGoal) -> GameChoice {
        switch choice {
        case .rock:
            return goal == .win ? .paper : .scissors
            
        case .paper:
            return goal == .win ? .scissors : .rock
            
        case .scissors:
            return goal == .win ? .rock : .paper
        }
    }
    
    static func evaluate(opponentChoice choice: GameChoice, correctAnswer: GameChoice) -> Bool {
        choice == correctAnswer
    }
}
