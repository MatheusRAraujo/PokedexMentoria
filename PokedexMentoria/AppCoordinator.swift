//
//  AppCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

final class AppCoordinator: Coordinator {

    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let vc = HomeViewController()
        vc.homeCoordinatorDelegate = self
        let nav = UINavigationController(rootViewController: vc)
        viewController = nav
        return nav
    }
    
    func didFinishChild() {
        childCoordinator = nil
    }
    
}

extension AppCoordinator: HomeCoordinatorDelegate {
    
    func goToFirstView() {
        let firstCoodinator = FirstViewCoordinator()
        route(from: firstCoodinator, present: .present)
    }
    
    func goToSecondView() {
        let firstCoodinator = SecondViewCoordinator()
        route(from: firstCoodinator, present: .push)
    }
}
