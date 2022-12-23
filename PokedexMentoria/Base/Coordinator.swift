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
    var navigation: UINavigationController? { get }
    
    func route(from coordinator: Coordinator, present: CoordinatorPresent)
    func start() -> UIViewController
    func didFinish()
}

extension Coordinator {
    
    var navigation: UINavigationController? {
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
        let vc = coordinator.start()
        viewController?.present(vc, animated: true)
    }

}

enum CoordinatorPresent {
    case push
    case present
}
