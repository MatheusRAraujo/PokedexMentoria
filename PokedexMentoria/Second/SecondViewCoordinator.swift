//
//  SecondViewCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 29/12/22.
//

import UIKit

class SecondViewCoordinator: Coordinator {
    
    weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        SecondViewController()
    }
    
    func didFinishChild() {
        childCoordinator = nil
    }
    
    deinit {
        #if DEBUG
        print("\(Self.self) desalocado")
        #endif
    }
    
}
