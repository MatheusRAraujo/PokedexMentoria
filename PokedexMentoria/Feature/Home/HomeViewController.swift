//
//  HomeViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func goToPokemonList()
    func goToAbilities()
    func goToMoves()
    func goToLocations()
    func goToItems()
    func goToTypes()
}

final class HomeViewController: UIViewController {
    
    weak var homeCoordinatorDelegate: HomeCoordinatorDelegate?
    
    // MARK: - ViewCode
    enum CardType: String, CaseIterable {
        case list = "Lista"
        case abilities = "Habilidades"
        case moves = "Ataques"
        case locations = "Locais"
        case items = "Itens"
        case types = "Tipos"

        var style: PokeballCard.Style {
            switch self {
            case .list:
                return .red
            case .abilities:
                return .orange
            case .moves:
                return .yellow
            case .locations:
                return .green
            case .items:
                return .blue
            case .types:
                return .purple
            }
        }
    }

    private var cards: [CardType: PokeballCard] = [:]

    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        CardType.allCases.forEach { type in
            let card = PokeballCard(style: type.style, title: type.rawValue)
            cards[type] = card
            card.delegate = self
            stackView.addArrangedSubview(card)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = .defaultSpacement
        return stackView
    }()
    
    let network = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeLayoutHierarch()
        
//        network.bateNaAPI(request: PokemonAPI.pokemonList) { (result: Result<PokemonList, Error>) in
//            switch result {
//            case .success(let pokemonList):
//                print(pokemonList)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        network.bateNaAPI(request: PokemonAPI.pokemon(id: 1)) { (result: Result<PokemonGeneral, Error>) in
//            switch result {
//            case .success(let pokemonList):
//                print("bulbasaur:", pokemonList)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
    }
    
    private func makeLayoutHierarch() {
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

extension HomeViewController: PokeballCardDelegate {
    
    func didTapCard(sender: PokeballCard) {
        switch sender {
        case cards[.list]:
            print("tap list card")
            print("homeCoordinator is \(homeCoordinatorDelegate)" )
            homeCoordinatorDelegate?.goToPokemonList()
        case cards[.abilities]:
            homeCoordinatorDelegate?.goToAbilities()
        case cards[.moves]:
            homeCoordinatorDelegate?.goToMoves()
        case cards[.locations]:
            homeCoordinatorDelegate?.goToLocations()
        case cards[.items]:
            homeCoordinatorDelegate?.goToItems()
        case cards[.types]:
            homeCoordinatorDelegate?.goToTypes()
        default:
            break
        }
    }
    
}

struct PokemonGeneral: Codable {
    var abilities: [Ability]
}

struct Ability: Codable {
    var ability: InsideAbility
    var isHidden: Bool
    var slot: Int
}

struct InsideAbility: Codable {
    var name: String
    var url: String
}