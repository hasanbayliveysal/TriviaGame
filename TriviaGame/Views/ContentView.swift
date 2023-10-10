//
//  ContentView.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var trivaVM: TriviaVM
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack (spacing: 20){
                    Text("Trivia Game")
                        .lilacTitle()
                    Text("Are you ready to test your Trivia skils?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {

                    TriviaView()
                        .environmentObject(TriviaVM())
                } label: {
                    PrimaryButton(text: "Let's Go!")
                }
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TriviaVM())
    }
   
}
