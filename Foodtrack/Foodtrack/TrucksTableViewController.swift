//
//  TrucksTableViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Parse

class TrucksTableViewController: UITableViewController, DAOFoodtruckProtocol {

    // set barName
    @IBOutlet weak var navName: UINavigationItem!
    
    // get index category
    static var tag = Int()
    
    //get carousel
    static var image1 = [UIImage()]
    static var image2 = [UIImage()]
    static var image3 = [UIImage()]

    
    var arrayTable = []
    
    let dbFoodtruck = DAOFoodtruck()
    
    
    // category
    var category = ["Hamburguer", "Hot Dog", "Massas", "Vegetariano", "Oriental", "Doces", "Bebidas", "Salgados"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nomeCategoria = category[TrucksTableViewController.tag]
        navName.title = nomeCategoria
        
        dbFoodtruck.delegate = self
        
        
        dbFoodtruck.listaFoodtrucksPorCategoria(nomeCategoria)
        
        
    }
    
    func terminouRequisicaoListaFoodtrucks(var array:[PFObject]){
        arrayTable = array
        self.tableView.reloadData()
    }
    func terminouRequisicaoListaFoodtrucksErro(){}
    
    func terminouSalvarFoodtruck(){}
    
    func terminouAvaliarSucesso(){}
    func terminouAvaliarErro(){}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1 
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return arrayTable.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("trucksCell", forIndexPath: indexPath) as! TrucksTableViewCell
        
        let objetoAtual = arrayTable[indexPath.row] as! PFObject
        
        if let arquivoFoto = objetoAtual["logo"] as? PFFile {
            arquivoFoto.getDataInBackgroundWithBlock({ (foto, error) -> Void in
                if(foto != nil){
                    cell.logoCell.image = UIImage(data: foto!)
                } 
            })
        }
        
        cell.titleCell.text = objetoAtual["nome"] as? String
        cell.categoryCell.text = objetoAtual["categoria"] as? String
        cell.valueCell.text = objetoAtual["preco"] as? String
        
        
        if let arquivoFoto1 = objetoAtual["foto1"] as? PFFile {
            arquivoFoto1.getDataInBackgroundWithBlock({ (foto, error) -> Void in
                if(foto != nil){
                    cell.imageCell.setBackgroundImage(UIImage(data: foto!), forState: .Normal)
                    cell.imageCell.tag = indexPath.row
                    TrucksTableViewController.image1.append(UIImage(data: foto!)!)
                }
            })
        }
        
        if let arquivoFoto2 = objetoAtual["foto2"] as? PFFile {
            arquivoFoto2.getDataInBackgroundWithBlock({ (foto, error) -> Void in
                if(foto != nil){
                    TrucksTableViewController.image2.append(UIImage(data: foto!)!)
                }
            })
        }
        
        if let arquivoFoto3 = objetoAtual["foto3"] as? PFFile {
            arquivoFoto3.getDataInBackgroundWithBlock({ (foto, error) -> Void in
                if(foto != nil){
                    TrucksTableViewController.image3.append(UIImage(data: foto!)!)
                }
            })
        }
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
