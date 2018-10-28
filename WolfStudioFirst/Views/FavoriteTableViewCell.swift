//
//  FavoriteTableViewCell.swift
//  WolfStudioFirst
//
//  Created by Ashik on 20/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var boothNoLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
