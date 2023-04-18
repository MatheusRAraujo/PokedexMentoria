//
//  DetailsViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import Foundation

protocol DetailsViewDelegate: AnyObject {
    func setUpInfo(model: PokemonModel)
}

protocol AbilitiesDetailsViewDelegate: AnyObject {
    func setUpAbilities(abilities: [AbilityModel])
}

protocol InfoDetailsViewDelegate: AnyObject {
    func setUpInfos(height: Int, weight: Int)
    func setUpSpecieInfo(pokedexEntry: String)
}

final class DetailsViewModel {
    
    let pokemonNumber: Int
    weak var delegate: DetailsCoordinatorDelegate?
    var detailsDelegate: DetailsViewDelegate?
    weak var abilitiesDelegate: AbilitiesDetailsViewDelegate?
    weak var infoDelegate: InfoDetailsViewDelegate?
    private let network = NetworkManager()
    var pokemonModel: PokemonModel?
    
    init(pokemonNumber: Int) {
        self.pokemonNumber = pokemonNumber
        loadInfos()
    }
    
    func loadInfos() {
        network.fetch(request: PokemonAPI.pokemon(id: pokemonNumber)) { [weak self] (result: Result<PokemonModel, Error>) in
            guard let self else { return }
            switch result {
            case .success(let pokemonModel):
                self.pokemonModel = pokemonModel
                self.detailsDelegate?.setUpInfo(model: pokemonModel)
                DispatchQueue.main.async {
                    self.abilitiesDelegate?.setUpAbilities(abilities: pokemonModel.abilities.compactMap{$0})
                    self.infoDelegate?.setUpInfos(height: pokemonModel.height, weight: pokemonModel.weight)
                }
                print(self.pokemonModel)
            case .failure(let error):
                print("Erro no details: \(error)")
            }
        }
        
        network.fetch(request: PokemonAPI.pokemonSpecies(id: pokemonNumber)) { [weak self] (result: Result<PokemonSpeciesModel, Error>) in
            guard let self else { return }
            print("id is: \(self.pokemonNumber)")
            switch result {
            case .success(let pokemonSpeciesModel):
                DispatchQueue.main.async {
                    self.infoDelegate?.setUpSpecieInfo(pokedexEntry: pokemonSpeciesModel.flavorTextEntries[0].flavorText)
                    print(pokemonSpeciesModel)
                }
            case .failure(let error):
                print("Erro no details: \(error)")
            }
        }
    }
    
    var pokemonName: String {
        pokemonModel?.name.capitalized ?? ""
    }
    
    var pokemonPokedexNumber: String {
        pokemonModel?.id.stringWithFourCharacters ?? "#0000"
    }
    
    func getTypes() -> [Types] {
        [.water, .fire]
    }
    
}
