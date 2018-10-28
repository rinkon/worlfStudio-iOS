//
//  CustomButton.swift
//  WolfStudioFirst
//
//  Created by Ashik on 16/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

}
