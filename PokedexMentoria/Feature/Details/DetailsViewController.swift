//
//  DetailsViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let viewModel: DetailsViewModel
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: .nameFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var pokemonNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let image = UIImage(systemName: "house.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var detailsPageViewController: TabBarComponent = {
        let vc1 = PokemonInfoViewController()
        viewModel.infoDelegate = vc1
        let vc2 = PokemonAbilitiesViewController(abilities: [AbilityModel(ability: AbilityNameModel(name: "placeholder"), isHidden: false)])
        viewModel.abilitiesDelegate = vc2
        let vc3 = StatsViewController()
        viewModel.statsDelegate = vc3
        vc3.view.backgroundColor = .white
        let viewsDictionary: [(String, UIViewController)] = [("Info", vc1), ("Abilities", vc2), ("Base Stats", vc3)]
        let tabBarComponent = TabBarComponent(viewControllersWithTitle: viewsDictionary)
        tabBarComponent.view.translatesAutoresizingMaskIntoConstraints = false
        return tabBarComponent
    }()
    
    private var detailsPageView: UIView {
        detailsPageViewController.view
    }
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        viewModel.detailsDelegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        makeLayout()
    }
    
    private func makeLayout() {
        view.addSubview(pokemonName)
        view.addSubview(pokemonNumber)
        view.addSubview(typesStackView)
        view.addSubview(pokemonImage)
        view.addSubview(detailsPageView)
        
        addChild(detailsPageViewController)
        
        let imageSize: CGFloat = view.bounds.size.width / 2
        
        NSLayoutConstraint.activate([
            pokemonName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .topSpacing),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .horizontalSpacing),
            pokemonName.heightAnchor.constraint(equalToConstant: .labelHeight),
            
            pokemonNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: .topSpacing),
            pokemonNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.horizontalSpacing),
            pokemonNumber.heightAnchor.constraint(equalToConstant: .labelHeight),
            
            typesStackView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 5),
            typesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .horizontalSpacing),
            typesStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -.horizontalSpacing),
            
            pokemonImage.topAnchor.constraint(equalTo: typesStackView.bottomAnchor, constant: .labelsToViewSpacing),
            pokemonImage.heightAnchor.constraint(equalToConstant: imageSize),
            pokemonImage.widthAnchor.constraint(equalToConstant: imageSize),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailsPageView.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 20),
            detailsPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsPageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

extension DetailsViewController: DetailsViewDelegate {
    func setUpInfo(model: PokemonModel) {
        DispatchQueue.main.async {
            self.pokemonNumber.text = self.viewModel.pokemonPokedexNumber
            self.pokemonName.text = self.viewModel.pokemonName
            self.view.backgroundColor = self.viewModel.backgroundColor
            
            self.typesStackView.arrangedSubviews.forEach { view in
                view.removeFromSuperview()
            }
            for type in self.viewModel.pokemonTypes {
                let typeCard = TypeTag(type: type)
                self.typesStackView.addArrangedSubview(typeCard)
            }
        }
    }
    
}

fileprivate extension CGFloat {
    static let nameFontSize: CGFloat = 20
    
    static let topSpacing: CGFloat = 10
    static let labelHeight: CGFloat = 40
    static let horizontalSpacing: CGFloat = 30
    static let labelsToViewSpacing: CGFloat = 20
}
