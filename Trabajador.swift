//
//  Trabajador.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/7/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

struct Trabajador {
    
    var nombre:String!
    var tipo:String!
    var klu:Int!
    var kma:Int!
    var kmi:Int!
    var kju:Int!
    var kvi:Int!
    var ksa:Int!
    var kdo:Int!
    
    init(nombre:String, klu:Int, kma:Int, kmi:Int, kju:Int, kvi:Int, ksa:Int, kdo:Int){
        
        self.nombre = nombre
        self.klu = klu
        
    }
    
    
}