//
//  Types.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 12/05/23.
//

import UIKit

enum Types: String, Codable {
    
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
