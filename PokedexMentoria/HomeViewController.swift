//
//  HomeViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    
}

final class HomeViewController: UIViewController {
    
    weak var homeCoordinatorDelegate: HomeCoordinatorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

