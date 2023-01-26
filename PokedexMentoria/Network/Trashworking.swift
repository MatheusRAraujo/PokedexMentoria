//
//  Trashworking.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 13/01/23.
//

import Foundation

class NetworkTrash {
    let baseUrl = "https://pokeapi.co/api/v2/"
    private let session = URLSession(configuration: .default)
    
    func bateNaAPI<T: Codable>(request: APIRequest, completion: @escaping((Result<T, Error>) -> Void)) {
        
        guard let pokeStringURL: URL = URL(string: baseUrl + request.path) else { return }
        let urlRequest = URLRequest(url: pokeStringURL)
        let task = session.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self else { return }
            if let error {
                completion(.failure(error))
            } else {
                if let data {
                    do {
                        let retrievedData: T = try self.decodeSafeData(decoder: request.decoder, data)
                        completion(.success(retrievedData))
                    } catch {
                            completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
    private func decodeSafeData<T: Codable> (decoder: JSONDecoder, _ data: Data) throws -> T {
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
