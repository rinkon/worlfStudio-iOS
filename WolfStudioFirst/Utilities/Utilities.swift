//
//  Utilities.swift
//  WolfStudioFirst
//
//  Created by Ashik on 10/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    static func addGradientToTopBar(theView: UIView){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0x4D, green: 0x87, blue: 0xF3).cgColor, UIColor(red: 0xF1, green: 0x44, blue: 0x5B).cgColor]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: theView.frame.width, height: theView.frame.height)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        theView.layer.insertSublayer(gradientLayer, at: 0)
    }
    static func addGradientToView(theView: UIView){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0x93, green: 0xB7, blue: 0xF5).cgColor, UIColor(red: 0xF6, green: 0x8C, blue: 0xA1).cgColor]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: theView.frame.width, height: theView.frame.height)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        theView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
