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
                                        text: "erro ao criar a lista de pokemon")
                self.coordinatorDelegate?.showFeedback(feedBack)
            }
        }
    }
    
    func getPokemonName(id: Int) -> String {
        let pokemonName = pokemonListage[id].name
        return pokemonName.capitalized
    }
    
    func formatIndex(index: Int) -> String {
        index.stringWithFourCharacters
    }
    
    func cellBackgroundColor(id: Int) -> UIColor {
        switch id {
        case 0...150: //Kanto - gen1
            return .systemPink
        case 151...250: //Johto - gen2
            return .systemBlue
        case 251...385: //Hoenn -gen3
            return .systemGreen
        case 386...492: //Sinnoh - gen4
            return .systemYellow
        case 492...648: //Unova - gen4
            return .systemGray
        case 649...720: //Kalos - gen6
            return .systemCyan
        case 721...808: //Alola - gen7
            return .systemTeal
        case 809...904: //Galar+Hisui - gen8
            return .systemOrange
        case 905...1008: //Paldea - gen9
            return .systemPurple
        default:
            return .white
        }
    }
    
    func detailsWithIndex(_ index: Int) {
        coordinatorDelegate?.goToDetailsWithIndex(index)
    }
}
