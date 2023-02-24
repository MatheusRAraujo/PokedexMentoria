//
//  DetailsViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

protocol DetailsViewModelDelegate: AnyObject {
    
}

final class DetailsViewModel {
    
    weak var delegate: DetailsViewModelDelegate?
    
}
