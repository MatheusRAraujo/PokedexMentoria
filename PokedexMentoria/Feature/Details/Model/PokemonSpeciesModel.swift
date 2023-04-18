//
//  PokemonSpeciesModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 14/04/23.
//

struct PokemonSpeciesModel: Codable {
    let color: PokemonColor
    let flavorTextEntries: [FlavorTextEntries]
    let genera: [Genera]
    
    enum CodingKes: String, CodingKey {
        case color
        case flavorTextEntries = "flavor_text_entries"
        case genera
    }
}

struct PokemonColor: Codable {
    let name: String
}

struct Genera: Codable {
    let genus: String
    let language: PokeLanguage
}

struct FlavorTextEntries: Codable {
    let flavorText: String
    let language: PokeLanguage
    
    enum CodingKes: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct PokeLanguage: Codable {
    let name: String
}
