//
//  HomeCard.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 30/12/22.
//

import UIKit

final class PokeballCard: CardView {

    enum Style: CaseIterable {
        case list
        case abilities
        case moves
        case locations
        case items
        case typeChart
    }
    
    let style: Style
    
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
    
    init(style: Style) {
        self.style = style
        super.init()
        
        backgroundColor = style.backgroundColor
        titleLabel.textColor = style.textColor
        titleLabel.text = style.title
        
        makeViewHierarch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
}

fileprivate extension PokeballCard.Style {
    var backgroundColor: UIColor {
        switch self {
        case .list: //red
            return UIColor(cgColor: CGColor(red: 223/255, green: 92/255, blue: 103/255, alpha: 1))
        case .abilities: //orange
            return UIColor(cgColor: CGColor(red: 230/255, green: 155/255, blue: 91/255, alpha: 1))
        case .moves: //yellow
            return UIColor(cgColor: CGColor(red: 237/255, green: 210/255, blue: 106/255, alpha: 1))
        case .locations: //green
            return UIColor(cgColor: CGColor(red: 80/255, green: 165/255, blue: 118/255, alpha: 1))
        case .items: // blue
            return UIColor(cgColor: CGColor(red: 83/255, green: 112/255, blue: 232/255, alpha: 1))
        case .typeChart: //purple
            return UIColor(cgColor: CGColor(red: 94/255, green: 68/255, blue: 144/255, alpha: 1))
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .moves:
            return .black
        default:
            return .white
        }
    }
    
    var title: String {
        switch self {
        case .list:
            return "Lista"
        case .abilities:
            return "Habilidades"
        case .moves:
            return "Ataques"
        case .locations:
            return "Locais"
        case .items:
            return "Itens"
        case .typeChart:
            return "Tipos"
        }
    }
}
