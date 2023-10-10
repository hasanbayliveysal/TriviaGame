//
//  ProgressButton.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text : String
    var backgroundColor : Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(backgroundColor)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct ProgressButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Play")
    }
}
