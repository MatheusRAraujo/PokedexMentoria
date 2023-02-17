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
    weak var listModelDelegate: ListViewDelegate?
    let network = NetworkManager()
    var pokemonListModel: PokemonListModel?
    
    var pokemonListage: [PokeList] {
        pokemonListModel?.results ?? []
    }
    
    func loadData() {
        network.fetch(request: PokemonAPI.pokemonList) { [weak self] (result: Result<PokemonListModel, Error>) in
            guard let self else { return }
            switch result {
            case .success(let pokemonList):
                self.pokemonListModel = pokemonList
                self.listModelDelegate?.reloadTableView()
            case .failure:
                let feedBack = Feedback(image: UIImage(systemName: "house.fill")!,
                                        title: "Deu ruim",
                                        text: "quero muito me mat4r!")
                self.coordinatorDelegate?.showFeedback(feedBack)
            }
        }
    }
    
}
