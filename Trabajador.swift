//
//  Trabajador.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/7/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

struct Trabajador {
    var idTrabajador:String!
    var nombreTrabajador:String!
    var tipo:String!
    var klu:Int!
    var kma:Int!
    var kmi:Int!
    var kju:Int!
    var kvi:Int!
    var ksa:Int!
    var kdo:Int!
    var idSemana:String!
    
    init (){
    }
    
    init(nombreTrabajador:String, klu:Int, kma:Int, kmi:Int, kju:Int, kvi:Int, ksa:Int, kdo:Int, idSemana:String){
        
        self.nombreTrabajador = nombreTrabajador
        self.klu = klu
        self.kma = kma
        self.kmi = kmi
        self.kju = kju
        self.kvi = kvi
        self.ksa = ksa
        self.kdo = kdo
        self.idSemana = idSemana
    }
    
    init(nombreTrabajador:String, klu:Int, kma:Int, kmi:Int, kju:Int, kvi:Int, ksa:Int, kdo:Int, idSemana:String, idTrabajador:String){
        
        self.nombreTrabajador = nombreTrabajador
        self.klu = klu
        self.kma = kma
        self.kmi = kmi
        self.kju = kju
        self.kvi = kvi
        self.ksa = ksa
        self.kdo = kdo
        self.idSemana = idSemana
        self.idTrabajador = idTrabajador
    }
    
    
}