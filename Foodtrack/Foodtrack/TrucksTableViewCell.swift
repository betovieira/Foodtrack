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
    
    // Imagens for next view
    @IBOutlet weak var imageCell: UIButton!
    @IBOutlet weak var imageCell2: UIButton!
    @IBOutlet weak var imageCell3: UIButton!
    
    @IBOutlet weak var valueCell: UILabel!
    @IBOutlet weak var distanceCell: UILabel!
    
    // SystemVote
    @IBOutlet weak var vote1: UIImageView!
    @IBOutlet weak var vote2: UIImageView!
    @IBOutlet weak var vote3: UIImageView!
    @IBOutlet weak var vote4: UIImageView!
    @IBOutlet weak var vote5: UIImageView!

    // String Foodtruck name
    static var foodName = [String()]
    
    @IBAction func getName(sender: AnyObject) {
        ShowViewController.navBarName = titleCell.text!
        ShowViewController.index = sender.tag
        ShowViewController.getLogo = logoCell.image!
        ShowViewController.image1 = imageCell.backgroundImageForState(UIControlState.Normal)
        ShowViewController.image2 = imageCell2.backgroundImageForState(UIControlState.Normal)
        ShowViewController.image3 = imageCell3.backgroundImageForState(UIControlState.Normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logoCell.layer.cornerRadius = logoCell.frame.size.width/230.0
        logoCell.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } 

}
