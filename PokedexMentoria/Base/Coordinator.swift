//
//  Coordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: Coordinator? { get set }
    var viewController: UIViewController? { get set }
    var navigationController: UINavigationController? { get set }
    
    func route(from coordinator: Coordinator, present: CoordinatorPresent)
    func start() -> UIViewController
}

extension Coordinator {

    func route(from coordinator: Coordinator, present: CoordinatorPresent) {

        childCoordinator = coordinator
        let nextViewController = coordinator.start()
        coordinator.viewController = nextViewController
        
        switch present {
        case .present:
            let newNav = UINavigationController(rootViewController: nextViewController)
            coordinator.navigationController = newNav
            newNav.present(newNav, animated: true)
        case .push:
            if let navigationController {
                coordinator.navigationController = navigationController
                navigationController.pushViewController(nextViewController, animated: true)
            } else {
                let feedBack = Feedback(image: UIImage(systemName: "house.fill")!,
                                        title: "Deu ruim",
                                        text: "erro em construir a tela")
               showFeedback(feedBack)
            }
        }
    }
    
    func showFeedback(_ feedback: Feedback) {
        DispatchQueue.main.async {
            let feedbackVC = FeedbackViewController(feedback: feedback)
            self.navigationController?.present(feedbackVC, animated: true)
        }
        
        
    }

}

enum CoordinatorPresent {
    case push
    case present
}
