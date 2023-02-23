//
//  ListCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

import UIKit

protocol ListCoordinatorDelegate: AnyObject {
    func showFeedback(_ feedback: Feedback)
}

final class ListCoodinator: Coordinator, ListCoordinatorDelegate {
    
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let viewModel = ListViewModel()
        viewModel.coordinatorDelegate = self
        return ListViewController(viewModel)
    }
    
}
