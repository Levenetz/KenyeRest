//
//  KanyeApi.swift
//  KanyeRest
//
//  Created by Victor Levenetz Mariano on 16/06/24.
//

import Foundation

// Classe para gerenciar a interação com a API de frases
class KanyeApi{
    func fetchFrase(completion: @escaping (Result<Phrases, Error>) -> Void) {
        guard let url = URL(string: "https://api.kanye.rest") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            if let data = data {
                do {
                    let fraseResponse = try JSONDecoder().decode(FraseAPIResponse.self, from: data)
                    let frase = Phrases(quotes: fraseResponse.quote)
                    completion(.success(frase))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

// Estrutura para representar a resposta da API
struct FraseAPIResponse: Codable {
    let quote: String
}
// Enum para gerenciar erros da API
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidLalaland
}
