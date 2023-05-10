//
//  DiagonalView.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 09/05/23.
//

import UIKit

final class DiagonalView: UIView {
    
//    func makeDraw(color: UIColor) {
//        self.color = color
//        draw(.zero)
//    }
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        self.backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    var color: UIColor = .clear
    
    override func draw(_ rect: CGRect) {
        // tamanho da view
        let screenSize = self.bounds.size
        let origin = self.bounds.origin
        
        let p1 = CGPoint(x: origin.x, y: origin.y)
        let p2 = CGPoint(x: p1.x, y: p1.y + screenSize.height)
        let p3 = CGPoint(x: origin.x + screenSize.width, y: p1.y )
        
        // cria o caminho ligando os pontos
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.close()
        
        // pinta o interior
        color.set()
        path.fill()
    }
    
}