//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jonathan on 2023-12-27.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain","UK", "Ukraine", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    

    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                    } label: {
                        Image(countries[number])
                    }
                }
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}


#Preview {
    ContentView()
}
