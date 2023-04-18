//
//  PokemonInfoViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 14/04/23.
//

import UIKit

final class PokemonInfoViewController: UIViewController {
    
    private lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.text = "Example Pokemon"
        label.font = .systemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pokedexEntryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aljsbkjasbcjlasbdfieablabjhfb ajcs lajbcjehlbab askjaburiw ;iabfiaubdakbwkfawk  a ;fb awiufb.awbd;aw ca;c;owabuwaw!"
        return label
    }()
    
    private func makeLayout() {
        view.addSubview(specieLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(pokedexEntryLabel)
        
        NSLayoutConstraint.activate([
            specieLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            specieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            specieLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            heightLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 10),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pokedexEntryLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10),
            pokedexEntryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokedexEntryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokedexEntryLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -10)
            
        ])
    }
}

extension PokemonInfoViewController: InfoDetailsViewDelegate {
    func setUpSpecieInfo(pokedexEntry: String) {
        let formatedText = pokedexEntry.replacingOccurrences(of: "\\s", with: " ", options: .regularExpression)
        print("entrada pra exibir:\(formatedText)")
        pokedexEntryLabel.text = formatedText
        
    }
    
    func setUpInfos(height: Int, weight: Int) {
        makeLayout()
        print("Calling make up infos view")
        
        let heightInMeter = Double(height) / 10.0
        let weightInKilograms = Double(weight) / 10.0
        
        heightLabel.text = "Height: \(heightInMeter) m"
        weightLabel.text = "Weight: \(weightInKilograms) kg"
    }
}
