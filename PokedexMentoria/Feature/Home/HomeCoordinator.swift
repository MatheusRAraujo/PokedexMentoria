//
//  HomeCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 09/01/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let homeViewController = HomeViewController()
        homeViewController.homeCoordinatorDelegate = self
        self.viewController = homeViewController
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        self.navigationController = homeNavigationController
        return homeNavigationController
    }
    
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    
    func goToPokemonList() {
        let coordinator = ListCoodinator()
        print("nex coordinator: \(coordinator)")
        print("atual viewController: \(viewController)")
        print("atual navigation :\(navigationController)")
        route(from: coordinator, present: .push)
    }
    
    func goToAbilities() {
    }
    
    func goToMoves() {
    }
    
    func goToLocations() {
    }
    
    func goToItems() {
    }
    
    func goToTypes() {
    }
    
}
