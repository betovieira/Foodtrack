//
//  SignUpViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: ResponsiveTextFieldViewController, DAOUsuarioProtocol {

    //UIButton
    @IBOutlet weak var SignUpWithFacebookButton: UIButton!
    @IBOutlet weak var SignUpWithTwitterButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    //  UITextField
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordAgainTxt: UITextField!
    
    //BANCO
    let dbUsuario = DAOUsuario()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 83/255.0, green: 71/255.0, blue: 65/255.0, alpha: 1)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]

        SignUpWithFacebookButton.layer.cornerRadius = 5
        SignUpWithTwitterButton.layer.cornerRadius = 5
        enterButton.layer.cornerRadius = 5
        
        dbUsuario.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func loginFacebookSucesso() {
        alertSucess("Sucesso", "Usuário logado!")
        SignInViewController.signIn = true
        
        self.navigationController?.popViewControllerAnimated(false)
    }
    func loginFacebookErro(){
        alertError("Falha", "Usuário não existe")
    }
    
    func cadastroSucesso(){
        /* Aqui coloca o evento do que acontece quando ele é cadastrado com sucesso */
        alertSucess("Sucesso", "Usuário logado!")
        SignInViewController.signIn = true
        
        self.navigationController?.popViewControllerAnimated(false)
    }
    func cadastroErro(error:NSError){
        /* Erro na hora do login */
        alertError("Falha", "Usuário não existe")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterAction(sender: AnyObject) {

        
        var usuario = PFUser()
        usuario.username = emailTxt.text
        usuario.password = passwordTxt.text
        usuario.email = emailTxt.text
        usuario["nome"] = nameTxt.text
        
        if dbUsuario.cadastrarUsuario(usuario) {
            SignInViewController.signIn = true
            self.navigationController?.popViewControllerAnimated(false)
            alertSucess("Sucesso", "Cadastrado com sucesso!")
        }else {
            alertError("Erro", "Alguns campos não foram preenchidos")
        }
    }
        
    @IBAction func SignUpWithFacebook(sender: AnyObject) {
        //  inserir codigo de cadastro via facebook
        
        dbUsuario.logarViaFacebook()

        
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
