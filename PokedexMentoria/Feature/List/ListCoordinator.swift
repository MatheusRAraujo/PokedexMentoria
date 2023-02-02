//
//  ListCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

import UIKit

protocol ListCoordinatorDelegate: AnyObject {
    func showFeedback(_ feedback: Feedback)
}

class ListCoodinator: Coordinator, ListCoordinatorDelegate {
    
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let viewModel = ListViewModel()
        if viewModel.pokeList.isEmpty {
            let image = UIImage(systemName: "house.fill") ?? UIImage()
            let feedback = Feedback(image:image, title: "erro na api", text: "nao foi possivel recuperar lista")
            showFeedback(feedback)
        }
        viewModel.coordinatorDelegate = self
        return ListViewController(viewModel)
    }
    
}
