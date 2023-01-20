//
//  Trashworking.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 13/01/23.
//

import Foundation

enum RequestType {
    case get
    case post
    case update
    case delete
}

class NetworkTrash {
    let baseUrl = "https://pokeapi.co/api/v2/"
    private let session = URLSession(configuration: .default)
    private let decoder = JSONDecoder()
    
    func bateNaAPI<T: Codable>(urlString: String, completion: @escaping( (T) -> Void ) ) {
        
        guard let pokeStringURL: URL = URL(string: baseUrl + urlString) else { return }
        let request = URLRequest(url: pokeStringURL)
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self else { return }
            if error == nil {
                if let data {
                    do {
                        let retrievedData: T = try self.decodeSafeData(data)
                        completion(retrievedData)
                    } catch  {
                        //erroHandler
                        print("caiu no catch")
                        print("error: \(error)")
                    }
                }
            } else {
                // errorHandler
            }
        }
        task.resume()
    }
    
    private func decodeSafeData<T: Codable> (_ data: Data) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
    
    
}

struct PokemonList: Codable {
    var results: [PokeList]
}

struct PokeList: Codable {
    var name: String
    var url: String
}
