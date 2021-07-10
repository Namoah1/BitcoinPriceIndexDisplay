//
//  BPITableViewCell.swift
//  BitcoinPriceIndexDisplay
//
//  Created by Nana Adwoa Odeibea Amoah on 7/10/21.
//

import UIKit

class BPITableViewCell: UITableViewCell {


    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var disclaimerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
