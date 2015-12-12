//
//  AgregarTrabajadorViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class AgregarTrabajadorViewController: UIViewController {
    
    @IBOutlet var nombreTrabajador: UITextField!
    @IBOutlet var klu: UITextField!
    @IBOutlet var kma: UITextField!
    @IBOutlet var kmi: UITextField!
    @IBOutlet var kju: UITextField!
    @IBOutlet var kvi: UITextField!
    @IBOutlet var ksa: UITextField!
    @IBOutlet var kdo: UITextField!
    

    var list:VerTrabajadorViewController!
    var pos:Int!
    var idSemanaAgregar:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(pos != nil){
            self.title = "Editar"
            //print("nombre insu: \(list.data[pos].nombreInsumo)")
            nombreTrabajador.text = list.data[pos!].nombreTrabajador
            klu.text = "\(list.data[pos!].klu)"
            kma.text = "\(list.data[pos!].kma)"
            kmi.text = "\(list.data[pos!].kmi)"
            kju.text = "\(list.data[pos!].kju)"
            kvi.text = "\(list.data[pos!].kvi)"
            ksa.text = "\(list.data[pos!].ksa)"
            kdo.text = "\(list.data[pos!].kdo)"

            
        }else{
            self.title = "Agregar"
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //accion de los botones
    
    @IBAction func agregarTrabajador(sender: AnyObject) {
        
        let trabajadorParse:TrabajadorParse = TrabajadorParse()
        
        //let insumoParse:InsumoParse = InsumoParse()
        
        
        
        if(pos != nil){
            //actualizar semana
            list.data[pos!].nombreTrabajador = nombreTrabajador.text
            list.data[pos!].klu = Int(klu.text!)
            list.data[pos!].kma = Int(kma.text!)
            list.data[pos!].kmi = Int(kmi.text!)
            list.data[pos!].kju = Int(kju.text!)
            list.data[pos!].kvi = Int(kvi.text!)
            list.data[pos!].ksa = Int(ksa.text!)
            list.data[pos!].kdo = Int(kdo.text!)
            trabajadorParse.updateTrabajador(list.data[pos!])
        }else{
            //crear nuevo
            
            var trabajador:Trabajador = Trabajador()
            trabajador.nombreTrabajador = nombreTrabajador.text
            trabajador.klu = Int(klu.text!)
            trabajador.kma = Int(kma.text!)
            trabajador.kmi = Int(kmi.text!)
            trabajador.kju = Int(kju.text!)
            trabajador.kvi = Int(kvi.text!)
            trabajador.ksa = Int(ksa.text!)
            trabajador.kdo = Int(kdo.text!)
            trabajador.idSemana = idSemanaAgregar
            trabajadorParse.insertTrabajador(trabajador)
            
            
        }
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
