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
