//
//  VerInsumoViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/10/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class VerInsumoViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var TablaInsumo: UITableView!
    
    var data:[Insumo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let semanaParse:InsumoParse = InsumoParse()
        
        data = []
        
        semanaParse.getAllInsumos(self)
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        TablaInsumo.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //metodos DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell: SemanaTableViewCell = tableView.dequeueReusableCellWithIdentifier("celda") as! SemanaTableViewCell
        
        let cell: InsumoTableViewCell = tableView.dequeueReusableCellWithIdentifier("celdaInsumo") as! InsumoTableViewCell
        
        let pos = indexPath.row
        
        
        // cell.nombreSemana.text = data[pos].nombreSemana
        cell.nombreInsumo.text = data[pos].nombreInsumo
        cell.costoInsumo.text = "\(data[pos].costoInsumo)"

        
        
        return cell
    }
    
    
    //accion de botones
    
    @IBAction func editarInsumo(sender: AnyObject) {
        if(TablaInsumo.indexPathsForSelectedRows == nil){
            self.showUnSelectedMessage("Editar Insumo")
        }else{
            performSegueWithIdentifier("edit", sender: nil)
        }
    }
    
    
    
    //funciones para la interacion entre botones y alertas
    func showUnSelectedMessage (title:String){
        let alert:UIAlertController = UIAlertController(title: title, message: "Seleccione Un Insumo", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextInsumo:AgregarInsumoViewController = segue.destinationViewController as! AgregarInsumoViewController
        
        if(segue.identifier == "edit"){
            nextInsumo.pos = TablaInsumo.indexPathForSelectedRow?.row
        }
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
