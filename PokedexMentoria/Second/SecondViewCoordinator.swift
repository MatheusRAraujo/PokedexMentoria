//
//  SecondViewCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 29/12/22.
//

import UIKit

class SecondViewCoordinator: Coordinator {

    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let view = SecondViewController()
        self.viewController = view
        return view
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
