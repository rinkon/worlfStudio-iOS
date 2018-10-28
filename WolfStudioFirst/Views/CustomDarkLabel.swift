//
//  CustomDarkLabel.swift
//  WolfStudioFirst
//
//  Created by Ashik on 15/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class CustomDarkLabel: UILabel {

    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 15, dy: 10))
    }
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }

}
