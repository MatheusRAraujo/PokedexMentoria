//
//  TypeTag.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import UIKit

final class TypeTag: UILabel {
    
    init(title: Types, color: String) {
        super.init(frame: .zero)
        self.text = " \(title.rawValue)"
        self.backgroundColor = .white
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
    
    case flying = "Flying"
    case normal = "Normal"
    case fire = "Fire"
    case grass = "Grass"
    case water = "Water"

}
