//
//  Coordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol CoordinatorDelegate: AnyObject {
    func didFinishChild()
}

protocol Coordinator: CoordinatorDelegate {
    var parentCoordinatorDelegate: CoordinatorDelegate? { get set }
    var childCoordinator: Coordinator? { get set }
    var viewController: UIViewController? { get set }
    var navigationController: UINavigationController? { get }
    
    func route(from coordinator: Coordinator, present: CoordinatorPresent)
    func start() -> UIViewController
    func didFinish()
}

extension Coordinator {
    
    var navigationController: UINavigationController? {
        viewController?.navigationController
    }

    func didFinish() {
        parentCoordinatorDelegate?.didFinishChild()
        parentCoordinatorDelegate = nil
        viewController = nil
    }

    func route(from coordinator: Coordinator, present: CoordinatorPresent) {

        coordinator.parentCoordinatorDelegate = self
        childCoordinator = coordinator
        let nextViewController = coordinator.start()

        switch present {
        case .present:
            viewController?.present(nextViewController, animated: true)
        case .push:
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }

}

enum CoordinatorPresent {
    case push
    case present
}
