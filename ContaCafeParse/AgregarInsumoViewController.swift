//
//  AgregarInsumoViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class AgregarInsumoViewController: UIViewController {

    @IBOutlet var nombreInsumo: UITextField!
    
    @IBOutlet var precioInsumo: UITextField!
    
    
    var list:VerInsumoViewController!
    var pos:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("--posicion: \(pos!)")
        if(pos != nil){
            self.title = "Editar"
            //print("nombre insu: \(list.data[pos].nombreInsumo)")
            nombreInsumo.text = list.data[pos!].nombreInsumo
            precioInsumo.text = "\(list.data[pos!].costoInsumo)"
            
        }else{
            self.title = "Agregar"
           
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func agregarInsumo(sender: AnyObject) {
        let insumoParse:InsumoParse = InsumoParse()
        
        
        
        if(pos != nil){
            //actualizar insumo
            list.data[pos!].nombreInsumo = nombreInsumo.text
            list.data[pos!].costoInsumo = Int(precioInsumo.text!)
            insumoParse.updateInsumo(list.data[pos!])
            
        }else{
            //crear nuevo
            let pre:Int! = Int(precioInsumo.text!)
             var insumo:Insumo = Insumo()
            insumo.nombreInsumo = nombreInsumo.text
            insumo.costoInsumo = pre
            insumoParse.insertInsumo(insumo)
        }
        
       // self.navigationController?.popToViewController(list, animated: true)
        //self.navigationController?.popToRootViewControllerAnimated(true)
        
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
