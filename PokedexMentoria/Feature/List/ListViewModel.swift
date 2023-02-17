//
//  ListViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

import UIKit

protocol ListViewDelegate: AnyObject {
    func reloadTableView()
}

class ListViewModel {
    
    weak var coordinatorDelegate: ListCoordinatorDelegate?
    var listModelDelegate: ListViewDelegate?
    let network = NetworkManager()
    var pokemonList: PokemonList?
    
    var pokeList: [PokeList] {
        pokemonList?.results ?? []
    }
    
    func loadData() {
        network.bateNaAPI(request: PokemonAPI.pokemonList) { [weak self] (result: Result<PokemonList, Error>) in
            guard let self else { return }
            switch result {
            case .success(let pokemonList):
                print(pokemonList)
                self.pokemonList = pokemonList
                self.listModelDelegate?.reloadTableView()
            case .failure(let error):
                print(error)
                let feedBack = Feedback(image: UIImage(systemName: "house.fill")!,
                                        title: "Deu ruim",
                                        text: "quero muito me mat4r!")
                self.coordinatorDelegate?.showFeedback(feedBack)
            }
        }
    }
    
}
