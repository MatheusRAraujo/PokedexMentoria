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
        self.color = color.darker() ?? .black
        super.init(frame: .zero)
        backgroundColor = color.lighter()
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

extension UIColor {

    func lighter(by percentage: CGFloat = 10.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 10.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
