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
        
        if(pos != nil){
            self.title = "Editar"
            nombreInsumo.text = list.data[pos!].nombreInsumo
            precioInsumo.text = "\(list.data[pos!].costoInsumo)"
        }

        // Do any additional setup after loading the view.
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
