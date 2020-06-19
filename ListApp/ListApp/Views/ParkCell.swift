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
    @IBOutlet weak var parkImageView: UIImageView!
    
    var park: Park? {
        didSet {
            self.parkNameLabel.text = park?.name
            self.parkCountryLabel.text = park?.country
            self.accessoryType = park!.confirmedVisit ? .checkmark : .none
            DispatchQueue.global(qos: .userInitiated).async {
                let parkImageData = NSData(contentsOf: URL(string: self.park!.imageUrl)!)
                DispatchQueue.main.async {
                    self.parkImageView.image = UIImage(data: parkImageData! as Data)
                    self.parkImageView.layer.cornerRadius = self.parkImageView.frame.width / 2
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
