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
        label.text = "bla bla bla"
        label.font = UIFont.boldSystemFont(ofSize: Constants.nameFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pokemonNumber: UILabel = {
        let label = UILabel()
        label.text = "#----"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typesStackView: UIStackView = {
        let types = viewModel.getTypes()
        var typeCards: [TypeTag] = []
        for type in types {
            typeCards.append(TypeTag(type: type))
        }
        let stackView = UIStackView(arrangedSubviews: typeCards)
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
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
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        viewModel.detailsDelegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        makeLayout()
//        pokemonName.text = viewModel.pokemonName
//        pokemonNumber.text = viewModel.pokemonPokedexNumber
    }
    
    private func makeLayout() {
        view.addSubview(pokemonName)
        view.addSubview(pokemonNumber)
        view.addSubview(typesStackView)
        view.addSubview(pokemonImage)
        
        let imageSize: CGFloat = view.bounds.size.width / 2
        
        NSLayoutConstraint.activate([
            pokemonName.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topSpacing),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            pokemonName.heightAnchor.constraint(equalToConstant: Constants.labelHeight),
            
            pokemonNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topSpacing),
            pokemonNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
            pokemonNumber.heightAnchor.constraint(equalToConstant: Constants.labelHeight),
            
            typesStackView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 5),
            typesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            typesStackView.heightAnchor.constraint(equalToConstant: 20),
            typesStackView.widthAnchor.constraint(equalToConstant: 150),
            
            pokemonImage.topAnchor.constraint(equalTo: typesStackView.bottomAnchor, constant: Constants.labelsToViewSpacing),
            pokemonImage.heightAnchor.constraint(equalToConstant: imageSize),
            pokemonImage.widthAnchor.constraint(equalToConstant: imageSize),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    enum Constants {
        static let nameFontSize: CGFloat = 20
        
        static let topSpacing: CGFloat = 100
        static let labelHeight: CGFloat = 40
        static let horizontalSpacing: CGFloat = 30
        static let labelsToViewSpacing: CGFloat = 20
    }

}

extension DetailsViewController: DetailsViewDelegate {
    func setUpInfo(model: PokemonModel) {
        DispatchQueue.main.async {
            self.pokemonNumber.text = self.viewModel.pokemonPokedexNumber
            self.pokemonName.text = self.viewModel.pokemonName
        }
    }
    
    
}
