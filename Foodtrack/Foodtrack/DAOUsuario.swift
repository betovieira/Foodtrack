//
//  DAOUsuario.swift
//  Foodtrack
//
//  Created by Humberto Vieira de Castro on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Parse

protocol DAOUsuarioProtocol {
    func loginFacebookSucesso()
    func loginFacebookErro()
    
    func cadastroSucesso()
    func cadastroErro(error:NSError)
    
}

class DAOUsuario: NSObject {
   var delegate: DAOUsuarioProtocol?
    
    /* CADASTRAR NORMAL */
    func cadastrarUsuario(usuario:PFUser) -> Bool {
        return usuario.signUp()
    }
    
    /* Variaveis usadas para pegar possiveis erros na hora de criar um novo usuário*/
    let errorDescript = NSUserDefaults.standardUserDefaults()
    let errorTrue = NSUserDefaults.standardUserDefaults()
    
    func cadastrarUsuarioBackground(usuario: PFUser) {
        usuario.signUpInBackgroundWithBlock { (success, error) -> Void in
            if let error = error {
                // Deu algum tipo de erro
                self.delegate?.cadastroErro(error)
            } else {
                // Usuario cadastrado com sucesso
                self.delegate?.cadastroSucesso()
            }
        }
    }
    
    
    func logarViaFacebook() {
        /* Permissoes que eu pedi para o usuário */
        let permissoes = ["email", "user_friends", "public_profile", "user_birthday"]
        
        /* Pergunto para o usuário se ele aceita passar suas informações pessoais */
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissoes) {
            (user, error) -> Void in
            /* Se o usuáruio não for nulo */
            if let user = user {
                /* Se o usuário for novo no banco de dados então adiciona
                no Parse, suas informações */
                if user.isNew {
                    self.cadastrarUsuarioFacebook()
                    println("Usuário novo")
                } else {
                    println("Usuário já existente. Logando via facebook!")
                }
                self.delegate?.loginFacebookSucesso()
            } else {
                self.delegate?.loginFacebookErro()
                println("Foi cancelado o login via Facebook")
            }
        }
    }

    /* Pega as informações do usuário do facebook não cadastrado
    e coloca no banco de dados do Parse */
    private func cadastrarUsuarioFacebook() -> Void
    {
        //self.deslogarUsuario()
        /* Cria um request das informações do usuário logado no facebook */
        /* Coloco os campos que eu quero extrair da conta do facebook do usuário */
        var fbRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"birthday, email, name, picture"])
        
        fbRequest.startWithCompletionHandler({ (FBSDKGraphRequestConnection, result, error) -> Void in
            
            if (error == nil && result != nil) {
                /* Recebo a resposta em forma de dicionário */
                let facebookData = result as! NSDictionary
                
                /* Pego o que as informações que pedi em cada dicionário */
                let userEmail = (facebookData.objectForKey("email") as! String)
                let name = (facebookData.objectForKey("name") as! String)
                let foto = (facebookData.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as! String)
                let birthday = (facebookData.objectForKey("birthday") as! String)
                
                /* Formato a data  para que seja enviada para o Parse */
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                let date = dateFormatter.dateFromString(birthday)
                
                /* Tranformo a foto em data para depois ser passada para o usuário*/
                let dataFoto = NSData(contentsOfURL: NSURL(string: foto)!)!
                
                // Coloco as informações no usuário local
                PFUser.currentUser()!.setValue(userEmail, forKey: "email")
                PFUser.currentUser()!.setValue(name, forKey: "nome")
                PFUser.currentUser()!.setValue(userEmail, forKey: "username")
                
                /* Coloca no banco na nuvem */
                PFUser.currentUser()?.save()
                println("Colocada as informações do facebook na nuvem!")
            }
        })
        
    }
    
    /* LOGAR NORMAL */
    func logarUsuario(username: String, senha: String) -> Bool {
        if let usuario = PFUser.logInWithUsername(username, password: senha) {
            return true
        }
        return false
    }
    
    func deslogarUsuario() {
        PFUser.logOut()
    }
    
    /* Verifica se já existe algum usuario logado */
    func usuarioEstaLogado() -> Bool {
        if let user = PFUser.currentUser() {
            return true
        }
        
        return false
    }
    
    
    
}
