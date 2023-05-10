//
//  ListViewCell.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 10/02/23.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    static let identifier = "listIdentifier"
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func setUp(title: String, number: String, backgroundColor: UIColor) {
        titleLabel.text = title
        numberLabel.text = number
        self.backgroundColor = backgroundColor
    }
    
    private func makeLayout() {
        addSubview(numberLabel)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 50),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
}
