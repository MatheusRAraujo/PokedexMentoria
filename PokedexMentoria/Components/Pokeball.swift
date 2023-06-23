//
//  Pokeball.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 06/01/23.
//

import UIKit

final class PokeBallView: UIView {
    
    // MARK: Variables
    private var viewCenter: CGPoint {
        CGPoint(x: frame.width / 2, y: frame.width / 2)
    }
    
    private var externalRadius: CGFloat {
        (frame.width - externalLineWidth) / 2
    }
    
    private var externalLineWidth: CGFloat {
        frame.width * 0.3
    }
    
    let color: UIColor
    
    // MARK: Inits
    init(color: UIColor, size: CGFloat) {
        self.color = color.darker() ?? .black
        super.init(frame: .zero)
        backgroundColor = color.lighter()
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size),
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
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
        
        let circlePath = UIBezierPath(arcCenter: viewCenter, radius: externalRadius / 3, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        color.setStroke()
        color.setFill()
        circlePath.lineWidth = externalLineWidth * 0.3
        circlePath.stroke()
        circlePath.fill()
    }
    
}
