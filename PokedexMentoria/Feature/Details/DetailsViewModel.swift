//
//  DetailsViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

protocol DetailsViewModelDelegate: AnyObject {
    
}

final class DetailsViewModel {
    
    let pokemonNumber: Int
    weak var delegate: DetailsViewModelDelegate?
    private let network = NetworkManager()
    
    init(pokemonNumber: Int) {
        self.pokemonNumber = pokemonNumber
        loadInfos()
    }
    
    func loadInfos() {
        network.fetch(request: PokemonAPI.pokemon(id: pokemonNumber)) { [weak self] (result: Result<PokemonModel, Error>) in
            guard let self else { return }
            switch result {
            case .success(let pokemonModel):
                print(pokemonModel)
            case .failure(let error):
                print("Erro no details: \(error)")
            }
        }
    }
    
    func getTypes() -> [Types] {
        [.water, .fire]
    }
    
}
