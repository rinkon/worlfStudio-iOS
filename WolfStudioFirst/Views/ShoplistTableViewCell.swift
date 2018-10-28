//
//  ShoplistTableViewCell.swift
//  WolfStudioFirst
//
//  Created by Ashik on 16/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class ShoplistTableViewCell: UITableViewCell {

    @IBOutlet weak var exhibitorNameLabel: UILabel!
    @IBOutlet weak var boothNoButton: CustomButton!
    @IBOutlet weak var messageButton: CustomButton!
    @IBOutlet weak var favoriteButton: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
