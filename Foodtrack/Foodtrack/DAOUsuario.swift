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
