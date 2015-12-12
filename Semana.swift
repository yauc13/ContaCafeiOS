//
//  Semana.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/9/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

struct Semana {
    var nombreSemana:String!
    var idSemana:String!
    
    init (){
    
    }
    
    init (nombreSemana:String){
        self.nombreSemana = nombreSemana
    }
    
    
    init (nombreSemana:String, idSemana:String){
        self.nombreSemana = nombreSemana
        self.idSemana = idSemana
    }
    
}