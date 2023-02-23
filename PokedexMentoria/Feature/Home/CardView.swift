//
//  CardView.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 30/12/22.
//

import UIKit

class CardView: UIView {
    
    init() {
        super.init(frame: .zero)
        setUpCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCard() {
        layer.masksToBounds = true
        layer.cornerRadius = .defaultCornerRadius
        backgroundColor = .white
        
    }
    
}
