//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Ethan Harianto on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var opacities = true
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    @State private var answer = ""
    @State private var turn = 1
    @State private var gameOver = false

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()

            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                Text("Score: " + String(score))
                    .foregroundStyle(.white)
                    .font(.title.bold())

                VStack(spacing: 15) {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))

                    ForEach(0 ..< 3) { number in
                        Button {
                            withAnimation {
                                flagTapped(number)
                            }
                        } label: {
                            FlagImage(flag: countries[number])
                                .rotation3DEffect(
                                    .degrees(answer == countries[number] ? 360 : 0),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .opacity(answer == countries[number] || opacities ? 1 : 0.25)
                                .scaleEffect(answer == countries[number] || opacities ? 1 : 0.8)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct" {
                Text("Your score is " + String(score) + ".")
            }
            if scoreTitle == "Wrong" {
                Text("Wrong! That’s the flag of " + answer + ".")
            }
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Restart", action: reset)
        } message: {
            Text("Your score was " + String(score))
        }
    }

    func reset() {
        score = 0
        turn = 1
        askQuestion()
    }

    func flagTapped(_ number: Int) {
        answer = countries[number]
        opacities.toggle()
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        turn += 1
        if turn == 8 {
            gameOver = true
        } else {
            showingScore = true
        }
    }

    func askQuestion() {
        opacities.toggle()
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct FlagImage: View {
    var flag: String
    var body: some View {
        Image(flag)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
