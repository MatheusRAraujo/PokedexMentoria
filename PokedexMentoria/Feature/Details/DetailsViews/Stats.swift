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
//        switch stat {
//        case .hp:
//            return .green
//        case .attack:
//            return .red
//        case .defense:
//            return .blue
//        case .specialAttack:
//            return .orange
//        case .specialDefense:
//            return .purple
//        case .speed:
//            return .yellow
//        }
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
//    static let veryLowStatus = UIColor(red: 250, green: 0, blue: 0) // < 59
////    static let lowStatus = UIColor(red: 255, green: 89, blue: 89) // 60 ... 69
//    static let mediumLowStats = UIColor(red: 240, green: 128, blue: 48) // 70 ... 79
//    static let mediumStats = UIColor(red: 248, green: 144, blue: 88) // 80 ... 89
//    static let mediumHighStats = UIColor(red: 238, green: 205, blue: 49) // 90 .. 99
//    static let highStats = UIColor(red: 167, green: 219, blue: 141) // 100 .. 119
//    static let veryHightStats = UIColor(red: 120, green: 200, blue: 80) // 120 >
    
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
