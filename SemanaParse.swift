//
//  SemanaParse.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/9/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation
import Parse


struct SemanaParse {
    let CLASS:String = "Semana"
    let C_NAME_SEM:String = "nom_semana"
    
    init(){
    
    }
    
    func insertSemana(semana:Semana){
        //PFObject parseObject= new PFObject(CLASS);
        let parseObject = PFObject(className:CLASS)
        parseSemana(parseObject, semana: semana)
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
    
    
    func parseSemana(parseObject:PFObject, semana:Semana){
        parseObject[C_NAME_SEM] = semana.nombreSemana
        
    }
    
    func updateSemana(semana:Semana){
        //ParseQuery<ParseObject> query = ParseQuery.getQuery(CLASS);
        let query = PFQuery(className:CLASS)
        query.getObjectInBackgroundWithId("xWMyZEGZ") {
            (parseObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let parseObject = parseObject {
                parseObject[self.C_NAME_SEM] = semana.nombreSemana
                parseObject.saveInBackground()
            }
        }
    }
    
    
    func getAllSemana() -> [Semana]{

        
        var data:[Semana] = [Semana]()
        var dataSemana:[Semana] = [Semana]()
        
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
                        let nomSem:String! = object.valueForKey(self.C_NAME_SEM) as! String
                        print("nombre sema: \(nomSem!)")
                        let s:Semana = Semana(nombreSemana: nomSem)
                        print("nombre sema list: \(s.nombreSemana)")
                        
                        data.append(s)
                        let tama:Int! = data.count
                        print("tamano for: \(tama!)")
                        
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
            print("tamano en el metodo: \(data.count)")
            
            for i in data {
                dataSemana.append(i)
            }
            print("tamano en el metodo sem: \(dataSemana.count)")
            
            
        }
        
        print("tamano fuera: \(data.count)")
        print("tamano fuera sem: \(dataSemana.count)")
        return dataSemana
    }
    

    
    
    
}