//
//  SemanaDao.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/13/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation
import SQLite

class SemanaDao{
    
    var db:Connection!
    let table = Table("Semana")
    let id = Expression<Int64>("id")
    let idSemana = Expression<String>("idSemana")
    let nombreSemana = Expression<String>("nombreSemana")
    
    init(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(
                .DocumentDirectory, .UserDomainMask, true
                ).first!
            
            db = try Connection("\(path)/Semana.sqlite3")
            try db!.run(table.create(ifNotExists:true){ t in
                t.column(id, primaryKey: true)
                t.column(idSemana)
                t.column(nombreSemana)
                })
            
        }catch{
            db = nil
        }
        
    }
    func insert(p:Semana)->Int64{
        let insert = table.insert(idSemana <- p.idSemana, nombreSemana <- p.nombreSemana )
        
        do{
            return try db.run(insert)
        }catch{
            return -1
        }
    }
    
    func delete(p:Semana){
        let filter = table.filter(idSemana == p.idSemana)
        do{
            try db.run(filter.delete())
        }catch{
        }
    }
    
    func deleteAll(){
        let filter = table
        do{
            try db.run(filter.delete())
        }catch{
        }
    }
    
    func getAll()->[Semana]{
        return rowsToList(db.prepare(table))
        
    }
    
    
    private func rowsToList(rows:AnySequence<Row>)->[Semana]{
        var data:[Semana] = [Semana]()
        
        for r in rows{
            data.append(rowToSemana(r)!)
        }
        
        return data
    }
    
    private func rowToSemana(row:Row? )->Semana?{
        if row == nil{
            return nil
        }else{
            var p:Semana =  Semana()
            // p.id = row![id]
            p.idSemana = row![idSemana]
            p.nombreSemana = row![nombreSemana]
            return p
        }
    }
    
}
