//
//  FirstViewCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 26/12/22.
//

import UIKit

class FirstViewCoordinator: Coordinator {

    weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        FirstViewController()
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
