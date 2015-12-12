//
//  InsumoParse.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation
import Parse


struct InsumoParse {
    let CLASS:String = "Insumos"
    let C_NAME_INS:String = "nom_insumo"
    let C_COST_INS:String = "costo_insumo"
    
    
    
    
    init(){
        
    }
    
    
    func insertInsumo(insumo:Insumo){
        //PFObject parseObject= new PFObject(CLASS);
        let parseObject = PFObject(className:CLASS)
        parseInsumo(parseObject, insumo: insumo)
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
    
    
    func parseInsumo(parseObject:PFObject, insumo:Insumo){
        parseObject[C_NAME_INS] = insumo.nombreInsumo
        parseObject[C_COST_INS] = insumo.costoInsumo
        
    }
    
    func updateInsumo(insumo:Insumo){
        //ParseQuery<ParseObject> query = ParseQuery.getQuery(CLASS);
        let query = PFQuery(className:CLASS)
        query.getObjectInBackgroundWithId(insumo.idInsumo) {
            (parseObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let parseObject = parseObject {
                parseObject[self.C_NAME_INS] = insumo.nombreInsumo
                parseObject[self.C_COST_INS] = insumo.costoInsumo
                parseObject.saveInBackground()
            }
        }
    }

    

func getAllInsumos(list:VerInsumoViewController) -> Void{
    
    
    
    let query = PFQuery(className:CLASS)
    //query.whereKey("playerName", equalTo:"Sean Plott")
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
                    let nomIns:String! = object.valueForKey(self.C_NAME_INS) as! String
                    let idIns:String! = object.objectId
                    let cosIns:Int! = object.valueForKey(self.C_COST_INS) as! Int
                    
                    let s:Insumo = Insumo(nombreInsumo: nomIns, costoInsumo: cosIns, idInsumo: idIns)
                    
                    list.data.append(s)
                                        
                }
            }
        } else {
            // Log details of the failure
            print("Error: \(error!) \(error!.userInfo)")
        }
        print("tamano en el metodo: \(list.data.count)")
        
        list.TablaInsumo.reloadData()
        
    }
    
    //print("tamano fuera: \(list.data.count)")
    
    
}
    
    

}