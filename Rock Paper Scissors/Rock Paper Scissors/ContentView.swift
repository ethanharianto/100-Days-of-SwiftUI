//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Ethan Harianto on 1/31/24.
//

import SwiftUI

struct icon: View {
    var play: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Text(play)
                .font(.system(size: 80))
        }
    }
}

struct ContentView: View {
    @State private var choices = ["rock", "paper", "scissors"].shuffled()
    var winners = ["rock": "paper", "paper": "scissors", "scissors": "rock"]
    @State private var enemy_choice = Int.random(in: 0 ... 2)
    @State private var score = 0
    @State private var title = ""
    @State private var showOutcome = false

    var body: some View {
        ZStack {
            VStack {
                Text("Rock Paper Scissors")
                    .font(.largeTitle.weight(.bold))

                Text("Score: " + String(score))
                    .font(.title.bold())

                VStack(spacing: 15) {
                    Text("Choose Your Move")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    Button {
                        makePlay("rock")
                    } label: {
                        icon(play: "🪨")
                    }
                    Button {
                        makePlay("scissors")
                    } label: {
                        icon(play: "✂️")
                    }
                    Button {
                        makePlay("paper")
                    } label: {
                        icon(play: "📄")
                    }
                }
                .padding()
            }
            .alert(title, isPresented: $showOutcome) {
                Button("Continue", action: nextGame)
            } message: {
                Text("Your score is " + String(score))
            }
        }
    }

    func makePlay(_ play: String) {
        let win = winners[choices[enemy_choice]]
        let tie = choices[enemy_choice]
        if play == win {
            score += 1
            title = "You Won!"
        } else if play == tie {
            title = "You Tied."
        } else {
            title = "You Lost..."
        }
        showOutcome.toggle()
    }
    
    func nextGame() {
        choices.shuffle()
        enemy_choice = Int.random(in: 0 ... 2)
    }
}

#Preview {
    ContentView()
}
