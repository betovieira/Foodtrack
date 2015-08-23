//
//  SignUpViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //UIButton
    @IBOutlet weak var SignUpWithFacebookButton: UIButton!
    @IBOutlet weak var SignUpWithTwitterButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpWithFacebookButton.layer.cornerRadius = 5
        SignUpWithTwitterButton.layer.cornerRadius = 5
        enterButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterAction(sender: AnyObject) {
        SignInViewController.signIn = true
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    @IBAction func SignUpWithFacebook(sender: AnyObject) {
        //  inserir codigo de cadastro via facebook
    }

    @IBAction func SignUpWithTwitterButton(sender: AnyObject) {
        //  inserir codigo de cadastro via facebook
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
