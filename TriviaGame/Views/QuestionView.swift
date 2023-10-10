//
//  QuestionView.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var trivaVM: TriviaVM
    var body: some View {
        VStack(spacing: 40) {
      
            HStack {
                Text("Trivia Game")
                    .lilacTitle()
                Spacer()
                Text("\(trivaVM.index+1) out of \(trivaVM.lenght)")
                    .padding()
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
                   
            }
            
            ProgressBar(progress: trivaVM.progress)
            
            VStack (alignment: .leading, spacing: 20) {
                Text(trivaVM.question)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .bold()
                ForEach(trivaVM.answerChoise, id: \.id) { answer in
                   AnswerRow(answer: answer)
                        .environmentObject(trivaVM)
                }
            }.padding(.horizontal)
            
            Button {
                trivaVM.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", backgroundColor: trivaVM.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!trivaVM.answerSelected)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.horizontal)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaVM())
    }
}
