//
//  SignInViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    var dbUsuario = DAOUsuario()
    
    //  Simple Var
    static var signIn = false
    
    //  UIButton
    @IBOutlet weak var SignInWithFacebookButton: UIButton!
    @IBOutlet weak var SignInWithTwitterButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!

    //  UITextField
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInWithFacebookButton.layer.cornerRadius = 5
        SignInWithTwitterButton.layer.cornerRadius = 5
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
        
        //let result = dbUsuario.logarUsuario("humbertovsieira12castro@gmail.com", senha: "123")
        //println("O RESULTADO DO LOGIN FOI: \(result)")
        
    }
    
    @IBAction func SignInWithFacebook(sender: AnyObject) {
        //  inserir codigo de cadastro via facebook
    }
    
    @IBAction func SignInWithTwitterButton(sender: AnyObject) {
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
