//
//  ListCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

import UIKit

protocol ListCoordinatorDelegate: AnyObject {
    func showFeedback(_ feedback: Feedback)
    func goToDetailsWithIndex(_ index: Int)
}

final class ListCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let viewModel = ListViewModel()
        viewModel.coordinatorDelegate = self
        return ListViewController(viewModel)
    }
    
}

extension ListCoordinator: ListCoordinatorDelegate {
    func goToDetailsWithIndex(_ index: Int) {
        let coordinator = DetailsCoordinator(pokemonNumber: index)
        route(from: coordinator, present: .push)
    }
    
}
