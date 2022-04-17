//
//  ChoiceSelector.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import SwiftUI

struct ChoiceSelector: View {
    let questionIndex: Binding<Int>
    let score: Binding<Int>
    var showingAlert: Binding<Bool>
    var alertMessage: Binding<String>
    let opponentChoice: Binding<GameChoice>
    let currentChoice: Binding<GameChoice>
    let currentGoal: Binding<GameGoal>
    let correctAnswer: GameChoice
    
    var body: some View {
        HStack {
            Button {
                runEvaluation(activeChoice: .rock)
            } label: {
                Text(GameChoice.rock.toString())
                    .choiceStyle(size: 40)
            }
            .buttonStyle(.bordered)
            
            Button {
                runEvaluation(activeChoice: .paper)
            } label: {
                Text(GameChoice.paper.toString())
                    .choiceStyle(size: 40)
            }
            .buttonStyle(.bordered)
            
            Button {
                runEvaluation(activeChoice: .scissors)
            } label: {
                Text(GameChoice.scissors.toString())
                    .choiceStyle(size: 40)
            }
            .buttonStyle(.bordered)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
    }
    
    private func runEvaluation(activeChoice: GameChoice) {
        currentChoice.changeValue(activeChoice)
        
        questionIndex.changeValue(questionIndex.value + 1)
        
        let evaluationResult = GameEvaluator.evaluate(opponentChoice: currentChoice.value, correctAnswer: correctAnswer)
        
        showingAlert.changeValue(true)
        
        alertMessage.changeValue(evaluationResult ? "You nailed it 🎯!" : "Nope, it was not right :/")
        
        let newScore = evaluationResult ? score.value + 1 : score.value - 1
        
        score.changeValue(newScore)
    }
}

struct ChoiceSelector_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceSelector(questionIndex: .constant(1), score: .constant(0), showingAlert: .constant(true), alertMessage: .constant("Yo!"), opponentChoice: .constant(.scissors), currentChoice: .constant(.paper), currentGoal: .constant(.win), correctAnswer: .paper)
    }
}
