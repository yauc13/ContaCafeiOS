//
//  AgregarSemanaViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/10/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class AgregarSemanaViewController: UIViewController {

    @IBOutlet var nombreSemana: UITextField!
    
    var list:VerSemanaViewController!
    var pos:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("--posicion: \(pos!)")
        if(pos != nil){
            self.title = "Editar"
            //print("nombre insu: \(list.data[pos].nombreInsumo)")
            nombreSemana.text = list.data[pos!].nombreSemana
            
            
        }else{
            self.title = "Agregar"
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    
    
    
    @IBAction func agregarSemana(sender: AnyObject) {
        
        let semanaParse:SemanaParse = SemanaParse()
        
        //let insumoParse:InsumoParse = InsumoParse()
        
        
        
        if(pos != nil){
            //actualizar semana
            list.data[pos!].nombreSemana = nombreSemana.text
            semanaParse.updateSemana(list.data[pos!])
            self.navigationController?.popToViewController(list, animated: true)
        }else{
            //crear nuevo
            
            var semana:Semana = Semana()
            semana.nombreSemana = nombreSemana.text
            semanaParse.insertSemana(semana)
            self.navigationController?.popToRootViewControllerAnimated(true)
           
        }
        
        
        
       // self.navigationController?.popToRootViewControllerAnimated(true)
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
