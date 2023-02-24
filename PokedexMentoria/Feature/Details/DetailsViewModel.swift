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
    
    init(pokemonNumber: Int) {
        self.pokemonNumber = pokemonNumber
    }
    
    weak var delegate: DetailsViewModelDelegate?
    
    func getTypes() -> [Types] {
        [.flying, .fire]
    }
    
}
