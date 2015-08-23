//
//  ShowViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    //  get navBar name
    @IBOutlet weak var navName: UINavigationItem!
    static var navBarName = String()
    @IBOutlet weak var labelName: UILabel!
    
    // get index
    static var index = Int()
    
    //  get Image
    static var getLogo = UIImage()
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logo.image = ShowViewController.getLogo
        self.logo.layer.cornerRadius = self.logo.frame.size.width/230.0
        self.logo.layer.masksToBounds = true
        navName.title = ShowViewController.navBarName
        var loopView = BannerLoopView(frame: CGRectMake(0, 100, self.view.bounds.size.width, 200), items: [TrucksTableViewController.image1[ShowViewController.index], TrucksTableViewController.image2[ShowViewController.index], TrucksTableViewController.image3[ShowViewController.index]])
        self.view.addSubview(loopView)
        self.labelName.text = ShowViewController.navBarName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
