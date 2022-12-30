//
//  Coordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol DidFinishCoordinatorDelegate {
    func didFinish()
}

protocol ParentCoordinatorDelegate: AnyObject {
    func didFinishChild()
}

protocol Coordinator: ParentCoordinatorDelegate, DidFinishCoordinatorDelegate {
    var parentCoordinatorDelegate: ParentCoordinatorDelegate? { get set }
    var childCoordinator: Coordinator? { get set }
    var viewController: UIViewController? { get set }
    var navigationController: UINavigationController? { get }
    
    func route(from coordinator: Coordinator, present: CoordinatorPresent)
    func start() -> UIViewController
}

extension Coordinator {
    
    var navigationController: UINavigationController? {
        viewController as? UINavigationController ?? viewController?.navigationController
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
            let newNav = UINavigationController(rootViewController: nextViewController)
            navigationController?.present(newNav, animated: true)
        case .push:
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }

}

enum CoordinatorPresent {
    case push
    case present
}
