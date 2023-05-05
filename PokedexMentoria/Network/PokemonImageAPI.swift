//
//  PokemonImageAPI.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 05/05/23.
//

enum PokemonImageAPI: APIRequest {
    case image(id: Int)
    
    var path: String {
        switch self {
        case .image(let id):
            return "\(id).png"
        }
    }
}
