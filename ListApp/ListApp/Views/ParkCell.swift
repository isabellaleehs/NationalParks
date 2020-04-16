//
//  ParkCellTableViewCell.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import UIKit

class ParkCell: UITableViewCell {
    
    @IBOutlet weak var parkNameLabel: UILabel!
    @IBOutlet weak var parkCountryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
