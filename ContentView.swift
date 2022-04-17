//
//  ContentView.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var questionIndex = 1
    
    @State private var score = 0
    
    @State private var showingAlert = false
    
    @State private var alertMessage = ""
    
    @State private var opponentChoice: GameChoice = .pickRandom()
    
    @State private var currentChoice: GameChoice = .rock
    
    @State private var currentGoal: GameGoal = .pickRandom()
    
    var correctAnswer: GameChoice {
        GameEvaluator.correctAnswer(choice: opponentChoice, goal: currentGoal)
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Score: \(score)")
                    .font(.title.weight(.medium))
                    .foregroundColor(score <= 0 ? .red : .green)
                    .animation(.spring())
                
                Text(opponentChoice.toString())
                    .choiceStyle()
                
                HStack(spacing: 2) {
                    Text("Game goal:")
                    
                    Text(currentGoal.toString())
                        .bold()
                }
                .font(.title2.weight(.regular))
            }
            
            ChoiceSelector(questionIndex: $questionIndex, score: $score, showingAlert: $showingAlert, alertMessage: $alertMessage, opponentChoice: $opponentChoice, currentChoice: $currentChoice, currentGoal: $currentGoal, correctAnswer: correctAnswer)
        }
        .alert("Result", isPresented: $showingAlert) {
            Button("OK") {
                $opponentChoice.changeValue(.pickRandom())
                
                $currentGoal.changeValue(.pickRandom())
            }
        } message: {
            Text(alertMessage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
