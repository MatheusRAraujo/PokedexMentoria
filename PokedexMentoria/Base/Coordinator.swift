//
//  Coordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol Coordinator: AnyObject {
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

    func route(from coordinator: Coordinator, present: CoordinatorPresent) {

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
