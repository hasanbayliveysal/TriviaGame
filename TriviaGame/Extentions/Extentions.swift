//
//  Extentions.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
            .padding()
    }
}
