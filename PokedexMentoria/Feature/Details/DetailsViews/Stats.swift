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
        switch stat {
        case .hp:
            return .green
        case .attack:
            return .red
        case .defense:
            return .blue
        case .specialAttack:
            return .orange
        case .specialDefense:
            return .purple
        case .speed:
            return .yellow
        }
    }
}
