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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func insertarSemana(sender: AnyObject) {
        let semanaParse:SemanaParse = SemanaParse()
        var semana:Semana = Semana()
        semana.nombreSemana = nombreSemana.text
        semanaParse.insertSemana(semana)
        
    }
    
    
    
    @IBAction func agregarSemana(sender: AnyObject) {
        let semanaParse:SemanaParse = SemanaParse()
        var semana:Semana = Semana()
        semana.nombreSemana = nombreSemana.text
        semanaParse.insertSemana(semana)
        semanaParse.getAllSemana()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
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
