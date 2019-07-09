//
//  CheckoutCell.swift
//  Exercise
//
//  Created by Andrei Bouariu on 7/9/19.
//  Copyright © 2019 abouariu. All rights reserved.
//

import UIKit

class CheckoutCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var total: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
