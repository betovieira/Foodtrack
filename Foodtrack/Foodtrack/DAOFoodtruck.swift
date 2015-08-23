//
//  DAOFoodtruck.swift
//  Foodtrack
//
//  Created by Humberto Vieira de Castro on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Parse

protocol DAOFoodtruckProtocol {
    func terminouRequisicaoListaFoodtrucks(var array:[PFObject])
    func terminouRequisicaoListaFoodtrucksErro()
    
    func terminouSalvarFoodtruck()
    
    func terminouAvaliarSucesso()
    func terminouAvaliarErro()
}

class DAOFoodtruck: NSObject {
    var delegate:DAOFoodtruckProtocol?
    
    func retornarFoodtruckPorID(idFoodtruck: String) -> PFObject? {
        var obj1 = PFQuery(className: "Foodtruck")
        var obj = PFObject(withoutDataWithClassName: "Foodtruck", objectId: idFoodtruck)
        return obj
    }
    
    /* Avalia o foodtruck */ 
    func avaliaFoodtruck(foodtruck:PFObject, avaliacao:Int) {
        /*print(foodtruck)
        
        var query = PFQuery(className: "Foodtruck")
        query.whereKey("objectId", equalTo: foodtruck.objectId!)
        
        let objeto = query.getFirstObject() as PFObject?
        
        var array = objeto?.objectForKey("avaliacao") as! [Int]
        array.append(4)
        
        objeto!.saveInBackgroundWithBlock { (success, error) -> Void in
            
            if success {
                print("Foodtruck Avaliado com sucesso!")
                self.delegate?.terminouAvaliarSucesso()
            } else {
                print("Foodtruck ERRO NA AVALIACAO! \(error?.description)")
                self.delegate?.terminouAvaliarErro()
            }
            
        }*/
    }
    
    func listaFoodtrucksPorCategoria(categoria:String) {
        var query = PFQuery(className: "Foodtruck")
        query.whereKey("categoria", equalTo: categoria)
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objetos = objects as? [PFObject] {
                //print(objetos)
                println("Lista de historias foi retornada com sucesso.")
                self.delegate?.terminouRequisicaoListaFoodtrucks(objetos)
                
            } else {
                println("Houve algum problema ao tentar retornar a lista de historias")
                self.delegate?.terminouRequisicaoListaFoodtrucksErro()
            }
        }
    }
    
    func listaFoodtrucksPorMelhorAvalicacao() {
        /* Lista todos e na tela normal eu trato eles como melhores avaliados calculando a média */
        
        var query = PFQuery(className: "Foodtruck")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objetos = objects as? [PFObject] {
                //print(objetos)
                println("Lista de historias foi retornada com sucesso.")
                self.delegate?.terminouRequisicaoListaFoodtrucks(objetos)
                
            } else {
                println("Houve algum problema ao tentar retornar a lista de historias")
                self.delegate?.terminouRequisicaoListaFoodtrucksErro()
            }
        }
    }
    
    
}
