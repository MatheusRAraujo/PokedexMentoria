//
//  ListCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

import UIKit

class ListCoodinator: Coordinator {
    
    private let network = NetworkTrash()
    
    var childCoordinator: Coordinator?
    var viewController: UIViewController?
    
    func start() -> UIViewController {
        let viewModel = ListViewModel()
        return ListViewController(viewModel)
    }
    
}
