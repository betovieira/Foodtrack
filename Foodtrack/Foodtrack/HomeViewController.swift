//
//  HomeViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!

    @IBAction func unwindToViewController (segue : UIStoryboardSegue) {
        SignInViewController.signIn = false
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInButton.layer.cornerRadius = 5.0
        SignUpButton.layer.cornerRadius = 5.0
        
        if(SignInViewController.signIn == true) {
            self.performSegueWithIdentifier("FoodtrackViewController", sender: self)
        }
        
        /*  ---- TESTES DE BANCO DE DADOS ---- */
        
        let dbFoodtruck = DAOFoodtruck()
        //let pfobject = dbFoodtruck.retornarFoodtruckPorID("W9e47M5r91")
        
        //dbFoodtruck.avaliaFoodtruck(pfobject!, avaliacao: 3)
        dbFoodtruck.listaFoodtrucksPorCategoria("Hamburguer")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if(SignInViewController.signIn == true) {
            self.performSegueWithIdentifier("FoodtrackViewController", sender: self)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
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
