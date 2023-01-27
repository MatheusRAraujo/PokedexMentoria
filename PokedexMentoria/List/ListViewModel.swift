//
//  ListViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

class ListViewModel {
    
    let network = NetworkTrash()
    var pokemonList: PokemonList?
    
    var pokeList: [PokeList] {
        pokemonList?.results ?? []
    }
    
    init() {
        network.bateNaAPI(request: PokemonAPI.pokemonList) { (result: Result<PokemonList, Error>) in
            switch result {
            case .success(let pokemonList):
                print(pokemonList)
                self.pokemonList = pokemonList
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
