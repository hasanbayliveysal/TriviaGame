//
//  TriviaModel.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import Foundation
import SwiftUI

struct TriviaModel: Decodable {
    
    var results : [Result]
    
    
    struct Result : Identifiable, Decodable  {
        
        var id : UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            }catch {
                print("Error settings formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers : [AnswerModel] {
            do {
                let correct = [AnswerModel(text:  try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let inCorrects = try incorrectAnswers.map { answer in
                    AnswerModel(text:  try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correct + inCorrects
                return allAnswers.shuffled()
               
            }catch {
                print("Error settings Array: \(error)")
                return []
            }
        }
    }

    
}

