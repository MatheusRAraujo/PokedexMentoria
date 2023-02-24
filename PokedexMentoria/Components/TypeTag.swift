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
        self.text = " \(type.rawValue)"
        self.backgroundColor = type.typeColor
        configureText()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureText() {
        font = UIFont.systemFont(ofSize: 12)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
}

enum Types: String {
    
    case dragon = "Dragon"
    case figthing = "Figthing"
    case ghost = "Ghost"
    case poison = "Poison"
    case bug = "Bug"
    case water = "Water"
    case rock = "Rock"
    case fire = "Fire"
    case grass = "Grass"
    case ice = "Ice"
    case normal = "Normal"
    case flying = "Flying"
    case iron = "Iron"
    case dark = "Dark"
    case psychic = "Psychic"
    case ground = "Ground"
    case eletric = "Eletric"
    case fairy = "Fairy"
    
    var typeColor: UIColor {
        switch self {
        case .fire:
            return .systemRed
        case .water:
            return .systemBlue
        case .grass:
            return .systemGreen
        default:
            return .gray
        }
    }

}
