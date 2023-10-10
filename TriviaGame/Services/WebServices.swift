//
//  WebServices.swift
//  TriviaGame
//
//  Created by Veysal on 10.10.2023.
//

import Foundation

class WebServices {
    
    func fetchTrivia(url: String) async throws -> TriviaModel {
        guard let safeUrl = URL(string: url) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: safeUrl)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(TriviaModel.self, from: data)
        
        return decodedData
    }
    
}
