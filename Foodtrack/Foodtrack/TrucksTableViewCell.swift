//
//  TrucksTableViewCell.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import ParseUI

class TrucksTableViewCell: PFTableViewCell {

    @IBOutlet weak var logoCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var categoryCell: UILabel!
    @IBOutlet weak var votesCell: UIImageView!
    @IBOutlet weak var imageCell: UIButton!
    @IBOutlet weak var valueCell: UILabel!
    @IBOutlet weak var distanceCell: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    // String Foodtruck name
    static var foodName = [String()]
    
    @IBAction func getName(sender: AnyObject) {
        ShowViewController.navBarName = titleCell.text!
        ShowViewController.index = sender.tag+1
        ShowViewController.getLogo = logoCell.image!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logoCell.layer.cornerRadius = logoCell.frame.size.width/2
        30.0
        logoCell.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } 

}
