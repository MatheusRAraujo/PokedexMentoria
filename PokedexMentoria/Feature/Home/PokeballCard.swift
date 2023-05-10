//
//  HomeCard.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 30/12/22.
//

import UIKit

@objc protocol PokeballCardDelegate: AnyObject {
    func didTapCard(sender: PokeballCard)
}

final class PokeballCard: CardView {

    enum Style: CaseIterable {
        case red
        case orange
        case yellow
        case green
        case blue
        case purple
    }
    
    let style: Style
    weak var delegate: PokeballCardDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "texto aleatorio"
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var pokeball: PokeBallView = {
        let pokeball = PokeBallView(color: style.backgroundColor, size: 50)
        return pokeball
    }()
    
    init(style: Style, title: String) {
        self.style = style
        super.init()
        
        backgroundColor = style.backgroundColor
        titleLabel.textColor = style.textColor
        titleLabel.text = title
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
        makeViewHierarch()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func makeViewHierarch() {
        addSubview(titleLabel)
        addSubview(pokeball)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: .defaultSpacement),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .defaultSpacement),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -.defaultSpacement),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pokeball.topAnchor.constraint(equalTo: topAnchor, constant: .defaultSpacement),
            pokeball.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
            pokeball.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.defaultSpacement),
            pokeball.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.defaultSpacement)
        ])
    }
    
    @objc func didTap() {
        delegate?.didTapCard(sender: self)
    }
    
}

fileprivate extension PokeballCard.Style {
    var backgroundColor: UIColor {
        switch self {
        case .red:
            return UIColor(cgColor: CGColor(red: 223/255, green: 92/255, blue: 103/255, alpha: 1))
        case .orange:
            return UIColor(cgColor: CGColor(red: 230/255, green: 155/255, blue: 91/255, alpha: 1))
        case .yellow:
            return UIColor(cgColor: CGColor(red: 237/255, green: 210/255, blue: 106/255, alpha: 1))
        case .green:
            return UIColor(cgColor: CGColor(red: 80/255, green: 165/255, blue: 118/255, alpha: 1))
        case .blue:
            return UIColor(cgColor: CGColor(red: 83/255, green: 112/255, blue: 232/255, alpha: 1))
        case .purple:
            return UIColor(cgColor: CGColor(red: 94/255, green: 68/255, blue: 144/255, alpha: 1))
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .yellow:
            return .black
        default:
            return .white
        }
    }

}
