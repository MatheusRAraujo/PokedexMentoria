//
//  AppCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    weak var parentCoordinatorDelegate: CoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        ViewController()
    }
    
    func didFinishChild() {
        childCoordinator = nil
    }
    
    
}


