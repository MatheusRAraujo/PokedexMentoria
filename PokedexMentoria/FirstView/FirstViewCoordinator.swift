//
//  FirstViewCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 26/12/22.
//

import UIKit

class FirstViewCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let view = FirstViewController()
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
