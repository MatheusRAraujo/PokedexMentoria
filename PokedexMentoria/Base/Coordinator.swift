//
//  Coordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol CoordinatorDelegate: AnyObject {
    func didFinishChilds()
}

protocol Coordinator: CoordinatorDelegate {
    var parentCoordinatorDelegate: CoordinatorDelegate? { get set }
    var childCoordinator: Coordinator? { get set }
    var viewController: UIViewController? { get set }
    var navigation: UINavigationController? { get }
    
    func route(from coordinator: Coordinator, present: CoordinatorPresent)
    func start()
    func didFinish()
}

extension Coordinator {
    
    var navigation: UINavigationController? {
        viewController?.navigationController
    }

    func didFinish() {
        parentCoordinatorDelegate?.didFinishChilds()
        parentCoordinatorDelegate = nil
        viewController = nil
    }

}

enum CoordinatorPresent {
    case push
    case present
}
