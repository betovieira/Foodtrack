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
    static var getLogo:UIImage!
    
    static var image1:UIImage!
    static var image2:UIImage!
    static var image3:UIImage!
    
    
    @IBOutlet weak var like: UIButton!
    @IBAction func like(sender: AnyObject) {
        if sender.tag == 7 {
            self.like.setBackgroundImage(UIImage(named: "Coracao_On"), forState: UIControlState.Normal)
            //sender.tag = 8.0
        }
        else {
            self.like.setBackgroundImage(UIImage(named: "Coração_off"), forState: UIControlState.Normal)
            //sender.tag = 7.0
        }
    }
    
    //  voteSystem
    @IBOutlet weak var vote1: UIButton!
    @IBOutlet weak var vote2: UIButton!
    @IBOutlet weak var vote3: UIButton!
    @IBOutlet weak var vote4: UIButton!
    @IBOutlet weak var vote5: UIButton!
    
    @IBAction func voteSystem(sender: AnyObject) {
        if sender.tag == 1 {
            self.vote1.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
        }
        if sender.tag == 2 {
            self.vote1.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote2.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
        }
        if sender.tag == 3 {
            self.vote1.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote2.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote3.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
        }
        if sender.tag == 4 {
            self.vote1.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote2.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote3.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote4.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
        }
        if sender.tag == 5 {
            self.vote1.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote2.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote3.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote4.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
            self.vote5.setBackgroundImage(UIImage(named: "Estrela_On"), forState: UIControlState.Normal)
        }
    }
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logo.image = ShowViewController.getLogo
        self.logo.layer.cornerRadius = self.logo.frame.size.width/230.0
        self.logo.layer.masksToBounds = true
        navName.title = ShowViewController.navBarName
        
        var loopView = BannerLoopView(frame: CGRectMake(0, 100, self.view.bounds.size.width, 200), items: [ShowViewController.image1, ShowViewController.image2, ShowViewController.image3])
        
        self.view.addSubview(loopView)
        self.labelName.text = ShowViewController.navBarName
        vote1.addTarget(self, action: "voteSystem:", forControlEvents: UIControlEvents.TouchUpInside)
        vote2.addTarget(self, action: "voteSystem:", forControlEvents: UIControlEvents.TouchUpInside)
        vote3.addTarget(self, action: "voteSystem:", forControlEvents: UIControlEvents.TouchUpInside)
        vote4.addTarget(self, action: "voteSystem:", forControlEvents: UIControlEvents.TouchUpInside)
        vote5.addTarget(self, action: "voteSystem:", forControlEvents: UIControlEvents.TouchUpInside)
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
