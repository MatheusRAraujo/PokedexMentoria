//
//  TypeTag.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import UIKit

final class TypeTag: UILabel {
    
    init(type: Types) {
        super.init(frame: .zero)
        self.text = " \(type.typeName)"
        self.textColor = type.textColor
        self.backgroundColor = type.typeColor
        configureText()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    private func configureText() {
        font = UIFont.systemFont(ofSize: 12)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 72),
            heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}

enum Types: String {
    
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    var typeName: String {
        return rawValue.capitalized
    }
    
    var textColor: UIColor {
        switch self {
        case .electric, .steel, .ice, .ground:
            return .black
        default:
            return .white
        }
    }
    
    var typeColor: UIColor {
        switch self {
        case .bug:
            return .bugMedium
        case .dark:
            return .darkMedium
        case .dragon:
            return .dragonMedium
        case .electric:
            return .eletricMedium
        case .fairy:
            return .fairyMedium
        case .fighting:
            return .fightingMedium
        case .fire:
            return .fireMedium
        case .flying:
            return .flyingMedium
        case .ghost:
            return .ghostMedium
        case .grass:
            return .grassMedium
        case .ground:
            return .groundMedium
        case .ice:
            return .iceMedium
        case .steel:
            return .steelMedium
        case .normal:
            return .normalMedium
        case .poison:
            return .poisonMedium
        case .psychic:
            return .psychicMedium
        case .rock:
            return .rockMedium
        case .water:
            return .waterMedium
        }
    }

}
