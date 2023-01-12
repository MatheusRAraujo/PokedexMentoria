//
//  HomeCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 09/01/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let homeViewController = HomeViewController()
        homeViewController.homeCoordinatorDelegate = self
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        viewController = homeViewController
        return homeNavigationController
    }
    
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    
    func goToPokemonList() {
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
