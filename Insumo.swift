//
//  Insumo.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/10/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

struct Insumo {
    var nombreInsumo:String!
    var costoInsumo:Int!
    var idInsumo:String!
    
    init (){
        
    }
    
    init (nombreInsumo:String, costoInsumo:Int){
        self.nombreInsumo = nombreInsumo
        self.costoInsumo = costoInsumo
    }
    
    init (nombreInsumo:String, costoInsumo:Int, idInsumo:String!){
        self.nombreInsumo = nombreInsumo
        self.costoInsumo = costoInsumo
        self.idInsumo = idInsumo
    }
}