//
//  PokemonModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

struct PokemonModel: Codable {
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    let types: [TypeModel]
    let abilities: [AbilityModel]
}

struct TypeModel: Codable {
    let type: TypeNameModel
}

struct TypeNameModel: Codable {
    let name: String
}

struct AbilityModel: Codable {
    let ability: AbilityNameModel
    let isHidden: Bool
    
    enum CodingKes: String, CodingKey {
        case abilityName
        case isHidden = "is_hidden"
    }
}

struct AbilityNameModel: Codable {
    let name: String
}