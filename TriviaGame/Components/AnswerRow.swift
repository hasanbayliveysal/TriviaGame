//
//  AnswerRow.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var trivaVM: TriviaVM
    
    // Custom colors
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    
    var answer : AnswerModel
    @State private var isSelected = false
    
    var body: some View {
        HStack (spacing:20){
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ?
                      "checkmark.circle.fill" :
                      "x.circle.fill")
                .foregroundColor(answer.isCorrect ?
                                 green:
                                 red)
                
                
            }
        }
        //.padding()
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height*0.05 ,alignment:  .leading)
        .background(.white)
        .foregroundColor(trivaVM.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red ): .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !trivaVM.answerSelected {
                isSelected = true
                trivaVM.selectAnswer(answer: answer)
            }
            
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: AnswerModel(text: "Answer_1", isCorrect: false))
            .environmentObject(TriviaVM())
    }
}
