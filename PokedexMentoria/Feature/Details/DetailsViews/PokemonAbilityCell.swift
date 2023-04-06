//
//  PokemonAbilityCell.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 31/03/23.
//

import UIKit

final class PokemonAbilityCell: UITableViewCell {
    
    static let identifier = "pokemonAbilityCellIdentifier"
    
    private lazy var abilityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var abilitySlotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    func setUp(abilityName: String) {
        makeLayout()
        
            self.abilityNameLabel.text = abilityName
            self.abilitySlotLabel.text = "slot X"
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func makeLayout() {
        contentView.addSubview(abilityNameLabel)
        contentView.addSubview(abilitySlotLabel)
        
        NSLayoutConstraint.activate([
            abilityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            abilityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            abilityNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            abilitySlotLabel.topAnchor.constraint(equalTo: abilityNameLabel.bottomAnchor, constant: 1),
            abilitySlotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            abilitySlotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            abilitySlotLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
