//
//  SignInViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class SignInViewController: ResponsiveTextFieldViewController {
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
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 83/255.0, green: 71/255.0, blue: 65/255.0, alpha: 1)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]

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
        
        let result = dbUsuario.logarUsuario(emailTxt.text, senha: passwordTxt.text)
        
        if result {
            alertSucess("Sucesso", "Usuário logado!")
            SignInViewController.signIn = result
            
            self.navigationController?.popViewControllerAnimated(false)
        }else{
            alertError("Falha", "Usuário não existe")
        }
        
        
        
        println("O RESULTADO DO LOGIN FOI: \(result)")
        
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
