//
//  CardView.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 30/12/22.
//

import UIKit

@objc protocol CardViewDelegate: AnyObject {
    func didTapCard(sender: CardView)
}

class CardView: UIView {
    
    weak var delegate: CardViewDelegate?
    
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
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    @objc func didTap() {
        delegate?.didTapCard(sender: self)
    }
    
}
