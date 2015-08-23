//
//  PopularTableViewController.swift
//  Foodtrack
//
//  Created by Paulo Henrique Leite on 8/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Parse


class PopularTableViewController: UITableViewController, DAOFoodtruckProtocol {
    
    let dbFoodtruck = DAOFoodtruck()
    var arrayTable = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 83/255.0, green: 71/255.0, blue: 65/255.0, alpha: 1)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        
        dbFoodtruck.delegate = self

        dbFoodtruck.listaFoodtrucksPorMelhorAvalicacao()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("popularCell", forIndexPath: indexPath) as! PopularTableViewCell
        
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
                }
            })
        }
        
        return cell
    }

    @IBAction func popButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
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
