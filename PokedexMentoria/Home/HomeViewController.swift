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
    
    // MARK: - ViewCode
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        PokeballCard.Style.allCases.forEach { style in
            let card = PokeballCard(style: style)
            card.delegate = self
            stackView.addArrangedSubview(card)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = .defaultSpacement
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeLayoutHierarch()
    }
    
    private func makeLayoutHierarch() {
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

}

extension HomeViewController: CardViewDelegate {
    
    func didTapCard(sender: CardView) {
        guard let sender = sender as? PokeballCard else {return}
        switch sender.style {
        case .list:
            break
        case .abilities:
            break
        case .moves:
            break
        case .locations:
            break
        case .items:
            break
        case .typeChart:
            break
        }
    }
    
}
