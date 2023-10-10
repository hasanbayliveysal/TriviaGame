//
//  TriviaVM.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import Foundation
import SwiftUI

class TriviaVM: ObservableObject {
    
    let webServices = WebServices()
    
    private(set) var trivia: [TriviaModel.Result] = []
    
    @Published private(set) var lenght = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoise: [AnswerModel] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init {
            await downloadData()
        }

    }
    func downloadData() async {
        
        do {
            let myTrivia = try await webServices.fetchTrivia(url: "https://opentdb.com/api.php?amount=10")
            DispatchQueue.main.async {
                self.index = 0
                self.lenght = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.trivia = myTrivia.results
                self.lenght = self.trivia.count
                self.setQuestion()
            }
        }catch {
            print("Error: \(error)")
        }
       
    }
    
    func goToNextQuestion() {
        if index + 1 < lenght {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
    
        answerSelected = false
        progress = CGFloat(Double((index+1))/Double(lenght)*UIScreen.main.bounds.width*0.9)
        
        if index < lenght {
            let currQuestion = trivia[index]
            question = currQuestion.formattedQuestion
            answerChoise = currQuestion.answers
        }
    }
    
    func selectAnswer(answer: AnswerModel) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
        
    }
}
