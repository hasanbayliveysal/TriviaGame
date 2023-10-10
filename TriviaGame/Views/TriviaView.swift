//
//  TriviaView.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var trivaVM: TriviaVM
    var body: some View {
        if trivaVM.reachedEnd {
            VStack (spacing: 20) {
                Text("Trivia Game")
                    .lilacTitle()
                Text("Congratulations, you completed the game! ")
                    .foregroundColor(Color("AccentColor"))
                Text("Your score \(trivaVM.score) out of \(trivaVM.lenght)")
                    .foregroundColor(Color("AccentColor"))
                
                Button {
                    Task.init {
                        await trivaVM.downloadData()
                    }
                }label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }else {
            QuestionView()
                .environmentObject(trivaVM)
        }
        
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaVM())
    }
}
