//
//  PokemonListModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 17/02/23.
//

struct PokemonListModel: Codable {
    var results: [PokeList]
}

struct PokeList: Codable {
    var name: String
    var url: String
}
