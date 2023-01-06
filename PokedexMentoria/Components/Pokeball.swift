//
//  Pokeball.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 06/01/23.
//

import UIKit

class PokeBallView: UIView {
    
    // MARK: Variables
    var viewCenter: CGPoint {
        CGPoint(x: frame.width / 2, y: frame.width / 2)
    }
    
    var externalRadius: CGFloat {
        (frame.width - externalLineWidth) / 2
    }
    
    var externalLineWidth: CGFloat {
        frame.width * 0.3
    }
    
    let color: UIColor
    
    // MARK: Inits
    init(color: UIColor, size: CGFloat) {
        self.color = color
        super.init(frame: .zero)
        backgroundColor = color.withAlphaComponent(0.4)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size),
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        draw(frame)
    }
    
    // MARK: Methods
    override func draw(_ rect: CGRect) {
        let topPath = UIBezierPath(arcCenter: viewCenter, radius: externalRadius, startAngle: -CGFloat.pi + 0.1, endAngle: 0.1, clockwise: true)
        color.setStroke()
        topPath.lineWidth = externalLineWidth
        topPath.stroke()
        
        let circlePath = UIBezierPath(arcCenter: viewCenter, radius: externalRadius / 3, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        color.setStroke()
        color.setFill()
        circlePath.lineWidth = externalLineWidth * 0.3
        circlePath.stroke()
        circlePath.fill()
    }
    
}
