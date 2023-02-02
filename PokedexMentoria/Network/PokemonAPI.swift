//
//  PokemonAPI.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 20/01/23.
//

import Foundation

enum PokemonAPI: APIRequest {
    
    var path: String {
        switch self {
        case .pokemon(let id):
            return "pokemon/\(id)/"
        case .pokemonList:
//            return "pokemon?limit=10"
            return "alsjhas-pokemon?limit=10"
        }
    }
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    case pokemon(id: Int)
    case pokemonList
}
