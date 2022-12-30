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
        let homeViewController = HomeViewController()
        homeViewController.homeCoordinatorDelegate = self
        let newNavigation = UINavigationController(rootViewController: homeViewController)
        viewController = newNavigation
        return newNavigation
    }
    
}

extension AppCoordinator: HomeCoordinatorDelegate {
    
}
