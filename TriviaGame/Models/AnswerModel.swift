//
//  AnswerModel.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import Foundation


struct AnswerModel : Identifiable {
    var id = UUID()
    var text : AttributedString
    var isCorrect : Bool
}
