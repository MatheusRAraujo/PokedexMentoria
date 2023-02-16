//
//  Int+Extensions.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 10/02/23.
//

extension Int {
    var stringWithFourCharacters: String {
        let count = "\(self)".count
        switch count {
        case 1:
            return "#000\(self)"
        case 2:
            return "#00\(self)"
        case 3:
            return "#0\(self)"
        case 4:
            return "#\(self)"
        default:
            return "#0000"
        }
    }
}
