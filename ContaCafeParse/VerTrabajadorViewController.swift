//
//  VerTrabajadorViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class VerTrabajadorViewController: UIViewController, UITableViewDataSource {

    
    
    @IBOutlet var TablaTrabajador: UITableView!
   
    var idSemaView:String!
    var data:[Trabajador]!
    let trabajadorParse:TrabajadorParse = TrabajadorParse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //data = []
        //trabajadorParse.getAllTrabajador(self)


       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        data = []
        
        trabajadorParse.getAllTrabajador(self)

        //TablaInsumo.reloadData()
    }
    
    
    
    
    // acciones de los botones
    
    
    @IBAction func agregarTrabajador(sender: AnyObject) {
        if(TablaTrabajador.indexPathsForSelectedRows == nil){
            self.showUnSelectedMessage("Editar Trabajador")
        }else{
            performSegueWithIdentifier("edit", sender: nil)
        }
    }
    
    @IBAction func eliminarTrabajador(sender: AnyObject) {
        if(TablaTrabajador.indexPathForSelectedRow == nil){
            self.showUnSelectedMessage("Eliminar Trabajador")
        }else{
            showDeleteTrabajador()
        }
    }
    
    
    //funciones para la interacion entre botones y alertas
    func showUnSelectedMessage (title:String){
        let alert:UIAlertController = UIAlertController(title: title, message: "Seleccione Un Trabajador", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if(segue.identifier == "edit"){
            let nextInsumo:AgregarTrabajadorViewController = segue.destinationViewController as! AgregarTrabajadorViewController
            nextInsumo.pos = TablaTrabajador.indexPathForSelectedRow?.row
            print("id que se envia\(idSemaView)")
            nextInsumo.idSemanaAgregar = self.idSemaView
            nextInsumo.list = self
        }else if(segue.identifier == "add"){
            let nextTrabajador:AgregarTrabajadorViewController = segue.destinationViewController as! AgregarTrabajadorViewController
            nextTrabajador.idSemanaAgregar = self.idSemaView
            nextTrabajador.list = self
            //nextInsumo.list = self
        }
        
        
    }
    
    func showDeleteTrabajador(){
        let s:Trabajador = data[(TablaTrabajador.indexPathForSelectedRow?.row)!]
        let alert:UIAlertController = UIAlertController(title: "Eliminar Trabajador", message: "Desea Eliminar el Trabajador \(s.nombreTrabajador)", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk:UIAlertAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.data.removeAtIndex((self.TablaTrabajador.indexPathForSelectedRow?.row)!)
            self.trabajadorParse.deleteTrabajador(s)
            self.TablaTrabajador.reloadData()
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
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
        
        let cell: TrabajadorTableViewCell = tableView.dequeueReusableCellWithIdentifier("celdaTrabajador") as! TrabajadorTableViewCell
        
        let pos = indexPath.row
        
        cell.nombreTrabajador.text = data[pos].nombreTrabajador
        cell.klu.text = "\(data[pos].klu)"
        cell.kma.text = "\(data[pos].kma)"
        cell.kmi.text = "\(data[pos].kmi)"
        cell.kju.text = "\(data[pos].kju)"
        cell.kvi.text = "\(data[pos].kvi)"
        cell.ksa.text = "\(data[pos].ksa)"
        cell.kdo.text = "\(data[pos].kdo)"

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
