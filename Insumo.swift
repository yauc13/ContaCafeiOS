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
    
    init (){
        
    }
    
    init (nombreInsumo:String, costoInsumo:Int){
        self.nombreInsumo = nombreInsumo
        self.costoInsumo = costoInsumo
    }
}