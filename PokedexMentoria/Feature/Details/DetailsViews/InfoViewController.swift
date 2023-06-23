//
//  InfoViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 14/04/23.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: Constants.specieLabelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightField: TextValue = {
        let textValue = TextValue()
        textValue.translatesAutoresizingMaskIntoConstraints = false
        return textValue
    }()
    
    private lazy var weightField: TextValue = {
        let textValue = TextValue()
        textValue.translatesAutoresizingMaskIntoConstraints = false
        return textValue
    }()
    
    private lazy var pokedexEntryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func makeLayout() {
        view.backgroundColor = .white
        
        view.addSubview(specieLabel)
        view.addSubview(heightField)
        view.addSubview(weightField)
        view.addSubview(pokedexEntryLabel)
        
        NSLayoutConstraint.activate([
            specieLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.specieLabelTopConstraint),
            specieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            specieLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),

            heightField.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: Constants.heightFieldDistance),
            heightField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            heightField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
            
            weightField.topAnchor.constraint(equalTo: heightField.bottomAnchor, constant: Constants.weightFieldDistance),
            weightField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            weightField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),

            pokedexEntryLabel.topAnchor.constraint(equalTo: weightField.bottomAnchor, constant: Constants.pokedexEntryDistance),
            pokedexEntryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            pokedexEntryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
            pokedexEntryLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor,
                                                      constant: -Constants.pokedexEntryBottonConstraint)
            
        ])
    }
    
    struct Constants {
        static let specieLabelSize: CGFloat = 20
        
        static let horizontalSpacing: CGFloat = 20
        static let specieLabelTopConstraint: CGFloat = 20
        static let heightFieldDistance: CGFloat = 20
        static let weightFieldDistance: CGFloat = 10
        static let pokedexEntryDistance: CGFloat = 30
        static let pokedexEntryBottonConstraint: CGFloat = 10
    }
}

extension InfoViewController: InfoDetailsViewDelegate {
    func setUpSpecieInfo(pokedexEntry: String, specieName: String) {
        pokedexEntryLabel.text = pokedexEntry
        specieLabel.text = specieName
    }

    func setUpInfos(height: String, weight: String) {
        makeLayout()
        
        heightField.setUpFields(fieldName: "Height:", fieldValue: height)
        weightField.setUpFields(fieldName: "Weight:", fieldValue: weight)
    }
}
