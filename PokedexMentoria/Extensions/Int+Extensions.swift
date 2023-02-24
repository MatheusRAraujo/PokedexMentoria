//
//  Int+Extensions.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 10/02/23.
//

extension Int {
    var stringWithFourCharacters: String {
        "#\(String(format: "%04d", self))"
    }
}
