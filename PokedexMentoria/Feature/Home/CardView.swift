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
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setUpCard() {
        layer.masksToBounds = true
        layer.cornerRadius = .defaultCornerRadius
        backgroundColor = .white
        
    }
    
}
