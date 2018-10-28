//
//  NewsTableViewCell.swift
//  WolfStudioFirst
//
//  Created by Ashik on 16/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell{

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 0, 5, 0))
    }

}
