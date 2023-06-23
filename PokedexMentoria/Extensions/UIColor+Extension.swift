//
//  UIColor+Extension.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 09/01/23.
//

import UIKit

extension UIColor {
    
    static let bugLight = UIColor(red: 198, green: 209, blue: 110)
    static let bugMedium = UIColor(red: 168, green: 184, blue: 32)
    
    static let darkLight = UIColor(red: 162, green: 146, blue: 136)
    static let darkMedium = UIColor(red: 112, green: 88, blue: 72)
    
    static let dragonLight = UIColor(red: 162, green: 125, blue: 250)
    static let dragonMedium = UIColor(red: 112, green: 56, blue: 248)
    
    static let eletricLight = UIColor(red: 250, green: 224, blue: 120)
    static let eletricMedium = UIColor(red: 248, green: 208, blue: 48)
    
    static let fairyLight = UIColor(red: 244, green: 189, blue: 201)
    static let fairyMedium = UIColor(red: 238, green: 153, blue: 172)
    
    static let fightingLight = UIColor(red: 214, green: 120, blue: 115)
    static let fightingMedium = UIColor(red: 192, green: 48, blue: 40)
    
    static let fireLight = UIColor(red: 245, green: 172, blue: 120)
    static let fireMedium = UIColor(red: 240, green: 128, blue: 48)
    
    static let flyingLight = UIColor(red: 198, green: 183, blue: 245)
    static let flyingMedium = UIColor(red: 168, green: 144, blue: 240)
    
    static let ghostLight = UIColor(red: 162, green: 146, blue: 168)
    static let ghostMedium = UIColor(red: 112, green: 88, blue: 152)
    
    static let grassLight = UIColor(red: 167, green: 219, blue: 141)
    static let grassMedium = UIColor(red: 120, green: 200, blue: 80)
    
    static let groundLight = UIColor(red: 235, green: 214, blue: 157)
    static let groundMedium = UIColor(red: 224, green: 192, blue: 104)
    
    static let iceLight = UIColor(red: 188, green: 230, blue: 230)
    static let iceMedium = UIColor(red: 152, green: 216, blue: 216)
    
    static let normalLight = UIColor(red: 198, green: 198, blue: 167)
    static let normalMedium = UIColor(red: 168, green: 168, blue: 120)
    
    static let poisonLight = UIColor(red: 193, green: 131, blue: 193)
    static let poisonMedium = UIColor(red: 160, green: 64, blue: 160)
    
    static let psychicLight = UIColor(red: 250, green: 146, blue: 178)
    static let psychicMedium = UIColor(red: 248, green: 88, blue: 136)
    
    static let rockLight = UIColor(red: 209, green: 193, blue: 125)
    static let rockMedium = UIColor(red: 184, green: 160, blue: 56)
    
    static let steelLight = UIColor(red: 209, green: 209, blue: 224)
    static let steelMedium = UIColor(red: 184, green: 184, blue: 208)
    
    static let waterLight = UIColor(red: 157, green: 183, blue: 245)
    static let waterMedium = UIColor(red: 104, green: 144, blue: 240)
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/CGFloat(255), green: green/CGFloat(255), blue: blue/CGFloat(255), alpha: 1)
    }

    func lighter(by percentage: CGFloat = 10.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 10.0) -> UIColor? {
        return self.adjust(by: -abs(percentage) )
    }

    private func adjust(by percentage: CGFloat) -> UIColor? {
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
