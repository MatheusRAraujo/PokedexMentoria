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
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.coordinatorDelegate = self
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.backgroundColor = .cyan
        viewController = nav
        return nav
    }
    
    func didFinishChild() {
        childCoordinator = nil
    }
    
    func goToFirstView() {
        let firstCoodinator = FirstViewCoordinator()
        route(from: firstCoodinator, present: .present)
    }
    
    func goToSecondView() {
        let firstCoodinator = SecondViewCoordinator()
        route(from: firstCoodinator, present: .push)
    }
    
    deinit {
        #if DEBUG
        print("\(Self.self) desalocado")
        #endif
    }
    
}


