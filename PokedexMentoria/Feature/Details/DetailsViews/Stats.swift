//
//  Stats.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 04/05/23.
//

import UIKit

struct BaseStats {

    enum BaseStat: String {
        case hp = "HP"
        case attack = "Attack"
        case defense = "Defense"
        case specialAttack = "Special Attack"
        case specialDefense = "Special Defense"
        case speed = "Speed"
    }
    
    var maxStatus: Int = 255

    var stat: BaseStat
    var value: Int
    
    var progress: Float {
        Float(value) / Float(maxStatus)
    }
    
    var stringValue: String {
        "\(value)"
    }
    
    init(stat: BaseStat, value: Int) {
        self.stat = stat
        self.value = value
    }

    var color: UIColor {
        switch value {
        case ...59:
              return .lowStats
        case 60...79:
            return .mediumStas
        case 80...99:
            return .mediumHighStats
        case 100...119:
            return .highStats
        case 120...:
            return .veryHightStats
        default:
            return .white
        }
    }
}

extension UIColor {
    
    // <59
    static let lowStats = UIColor(red: 255, green: 0, blue: 0)
    // 60...79
    static let mediumStas = UIColor(red: 255, green: 167, blue: 0)
    // 80..99
    static let mediumHighStats = UIColor(red: 255, green: 244, blue: 0)
    // 100...119
    static let highStats = UIColor(red: 163, green: 255, blue: 0)
    // 120
    static let veryHightStats = UIColor(red: 44, green: 184, blue: 0)
}
