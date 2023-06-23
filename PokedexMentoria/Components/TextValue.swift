//
//  TextValue.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 25/04/23.
//

import UIKit

final class TextValue: UIView {
    
    private let textSize: CGFloat = 16
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: textSize)
        return label
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: textSize)
        label.textColor = .darkGray
        return label
    }()
    
    func setUpFields(fieldName: String, fieldValue: String) {
        makeLayout()
        
        self.leftLabel.text = fieldName
        self.rightLabel.text = fieldValue
    }
    
    private func makeLayout() {
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: topAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rightLabel.topAnchor.constraint(equalTo: topAnchor),
            rightLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 10),
            rightLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            rightLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
