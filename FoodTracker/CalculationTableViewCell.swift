//
//  CalculationTableViewCell.swift
//  FoodTracker
//
//  Created by Yabaze T on 10/04/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class CalculationTableViewCell: UITableViewCell {

    @IBOutlet weak var principalLabel: UILabel!
    @IBOutlet weak var numberOfYearsLabel: UILabel!
    @IBOutlet weak var rateOfInterestLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
