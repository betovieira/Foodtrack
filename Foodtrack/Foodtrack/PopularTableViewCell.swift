//
//  PopularTableViewCell.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var logoCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var categoryCell: UILabel!
    @IBOutlet weak var valueCell: UILabel!
    @IBOutlet weak var distanceCell: UILabel!
    @IBOutlet weak var votesCell: UIImageView!
    @IBOutlet weak var imageCell: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logoCell.layer.cornerRadius = 30.0
        logoCell.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
