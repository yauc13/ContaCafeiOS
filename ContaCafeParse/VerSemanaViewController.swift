//
//  VerSemanaViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/9/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import Parse

class VerSemanaViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var TablaSemana: UITableView!
    
   
    
    var data:[Semana]!
    let semanaParse:SemanaParse = SemanaParse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        //data = []
     //semanaParse.getAllSemana(self)


        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        data = []
        semanaParse.getAllSemana(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //metodos de accion de los botones
    
    
    
    
    @IBAction func insertarSemana(sender: AnyObject) {
        if(TablaSemana.indexPathsForSelectedRows == nil){
            self.showUnSelectedMessage("Editar Semana")
        }else{
            performSegueWithIdentifier("edit", sender: nil)
        }
    }
    
    
    @IBAction func eliminarSemana(sender: AnyObject) {
        if(TablaSemana.indexPathForSelectedRow == nil){
            self.showUnSelectedMessage("Eliminar Semana")
        }else{
            showDeleteSemana()
        }
    }
    
    
    @IBAction func mostrarTrabajadores(sender: AnyObject) {
        if(TablaSemana.indexPathsForSelectedRows == nil){
            self.showUnSelectedMessage("Ver Trabajadores de la Semana")
        }else{
            performSegueWithIdentifier("goToListaTrabajador", sender: nil)
        }
    }
    
    
    
    //funciones para la interacion entre botones y alertas
    func showUnSelectedMessage (title:String){
        let alert:UIAlertController = UIAlertController(title: title, message: "Seleccione Una Semana", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showDeleteSemana(){
        let s:Semana = data[(TablaSemana.indexPathForSelectedRow?.row)!]
        let alert:UIAlertController = UIAlertController(title: "Eliminar Semana", message: "Desea Eliminar la Semana \(s.nombreSemana)", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk:UIAlertAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.data.removeAtIndex((self.TablaSemana.indexPathForSelectedRow?.row)!)
            self.semanaParse.deleteSemana(s)
            self.TablaSemana.reloadData()
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
  

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if(segue.identifier == "edit"){
            let nextInsumo:AgregarSemanaViewController = segue.destinationViewController as! AgregarSemanaViewController
            nextInsumo.pos = TablaSemana.indexPathForSelectedRow?.row
            nextInsumo.list = self
        }else if(segue.identifier == "goToListaTrabajador"){
            let nextTrabajador:VerTrabajadorViewController = segue.destinationViewController as! VerTrabajadorViewController
            let pos:Int! = TablaSemana.indexPathForSelectedRow?.row
            let idSe:String! = data[pos!].idSemana
            nextTrabajador.idSemaView = idSe
            //nextInsumo.list = self
        }
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
        
        let cell: SemanaTableViewCell = tableView.dequeueReusableCellWithIdentifier("celda") as! SemanaTableViewCell
        
        let pos = indexPath.row
        
        
       // cell.nombreSemana.text = data[pos].nombreSemana
       cell.nombreSemana.text = data[pos].nombreSemana
        
         
        return cell
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
