//
//  DetailsViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

protocol DetailsViewDelegate: AnyObject {
    func setUpInfo(model: PokemonModel)
}

final class DetailsViewModel {
    
    let pokemonNumber: Int
    weak var delegate: DetailsCoordinatorDelegate?
    var detailsDelegate: DetailsViewDelegate?
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
                print(self.pokemonModel)
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
