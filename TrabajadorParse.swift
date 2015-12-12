//
//  TrabajadorParse.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation
import Parse


struct TrabajadorParse {
    let CLASS:String = "Trabajador"
    let C_NAME_TRA:String = "nombre"
    let C_KLU:String = "klu"
    let C_KMA:String = "kma"
    let C_KMI:String = "kmi"
    let C_KJU:String = "kju"
    let C_KVI:String = "kvi"
    let C_KSA:String = "ksa"
    let C_KDO:String = "kdom"
    let C_IDSEMANA:String = "idsemana"
    
    
    
    
    init(){
        
    }
    
    
    func insertTrabajador(trabajador:Trabajador){
        //PFObject parseObject= new PFObject(CLASS);
        let parseObject = PFObject(className:CLASS)
        parseTrabajador(parseObject, trabajador: trabajador)
        //parseObject.saveInBackground(this);
        parseObject.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        
    }
    
    
    func parseTrabajador(parseObject:PFObject, trabajador:Trabajador){
        parseObject[C_NAME_TRA] = trabajador.nombreTrabajador
        parseObject[C_KLU] = trabajador.klu
        parseObject[C_KMA] = trabajador.kma
        parseObject[C_KMI] = trabajador.kmi
        parseObject[C_KJU] = trabajador.kju
        parseObject[C_KVI] = trabajador.kvi
        parseObject[C_KSA] = trabajador.ksa
        parseObject[C_KDO] = trabajador.kdo
        parseObject[C_IDSEMANA] = trabajador.idSemana
        
    }
    
    func updateInsumo(trabajador:Trabajador){
        //ParseQuery<ParseObject> query = ParseQuery.getQuery(CLASS);
        let query = PFQuery(className:CLASS)
        query.getObjectInBackgroundWithId(trabajador.idTrabajador) {
            (parseObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let parseObject = parseObject {
                parseObject[self.C_NAME_TRA] = trabajador.nombreTrabajador
                parseObject[self.C_KLU] = trabajador.klu
                parseObject[self.C_KMA] = trabajador.kma
                parseObject[self.C_KMI] = trabajador.kmi
                parseObject[self.C_KJU] = trabajador.kju
                parseObject[self.C_KVI] = trabajador.kvi
                parseObject[self.C_KSA] = trabajador.ksa
                parseObject[self.C_KDO] = trabajador.kdo
                parseObject[self.C_IDSEMANA] = trabajador.idSemana
                parseObject.saveInBackground()
            }
        }
    }
    
    
    
    func getAllTrabajador(list:VerTrabajadorViewController) -> Void{

        let query = PFQuery(className:CLASS)
        query.whereKey(C_IDSEMANA, equalTo:list.idSemaView)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        //s.nombreSemana = object[C_NAME_SEM]
                        print(object.objectId)
                        let nomTra:String! = object.valueForKey(self.C_NAME_TRA) as! String
                        let idTra:String! = object.objectId                        
                        let idSem:String! = object.valueForKey(self.C_IDSEMANA) as! String
                        let klu:Int! = object.valueForKey(self.C_KLU) as! Int
                        let kma:Int! = object.valueForKey(self.C_KLU) as! Int
                        let kmi:Int! = object.valueForKey(self.C_KLU) as! Int
                        let kju:Int! = object.valueForKey(self.C_KLU) as! Int
                        let kvi:Int! = object.valueForKey(self.C_KLU) as! Int
                        let ksa:Int! = object.valueForKey(self.C_KLU) as! Int
                        let kdo:Int! = object.valueForKey(self.C_KLU) as! Int
                        
                        let s:Trabajador = Trabajador(nombreTrabajador: nomTra, klu: klu, kma: kma, kmi: kmi, kju: kju, kvi: kvi, ksa: ksa, kdo: kdo, idSemana: idSem, idTrabajador: idTra)
                        
                        list.data.append(s)
                        
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
            print("tamano en el metodo: \(list.data.count)")
            
            list.TablaTrabajador.reloadData()
            
        }
        
        //print("tamano fuera: \(list.data.count)")
        
        
    }
    
    
    
}