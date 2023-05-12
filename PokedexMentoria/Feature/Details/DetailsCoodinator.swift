//
//  DetailsCoodinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import UIKit

protocol DetailsCoordinatorDelegate: AnyObject {}

final class DetailsCoordinator: Coordinator {

    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController?
    
    private let pokemonNumber: Int
    
    init(pokemonNumber: Int) {
        self.pokemonNumber = pokemonNumber
    }
    
    func start() -> UIViewController {
        let viewModel = DetailsViewModel(pokemonNumber: pokemonNumber)
        viewModel.delegate = self
        let detailsVC = DetailsViewController(viewModel: viewModel)
        viewModel.detailsDelegate = detailsVC
        return detailsVC
    }
    
}

extension DetailsCoordinator: DetailsCoordinatorDelegate {}
