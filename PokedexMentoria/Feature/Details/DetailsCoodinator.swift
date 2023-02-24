//
//  DetailsCoodinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import UIKit

final class DetailsCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let viewModel = DetailsViewModel()
        viewModel.delegate = self
        let detailsVC = DetailsViewController(viewModel: viewModel)
        return detailsVC
    }
    
}

extension DetailsCoordinator: DetailsViewModelDelegate {}
