//
//  SeminarScheduleTableViewCell.swift
//  WolfStudioFirst
//
//  Created by Ashik on 23/10/18.
//  Copyright © 2018 Ashik. All rights reserved.
//

import UIKit

class SeminarScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationSwitch: CustomSwitch!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var venueLabel: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var seminerImageView: UIImageView!
    @IBOutlet weak var seminarTitleLabel: UILabel!
    @IBOutlet weak var seminarSpeakerLabel: UILabel!
    @IBOutlet weak var seminarDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
