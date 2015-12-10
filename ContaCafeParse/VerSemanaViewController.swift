//
//  VerSemanaViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/9/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import Parse

class VerSemanaViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var TablaSemana: UITableView!
    
    var data:[Semana]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let semanaParse:SemanaParse = SemanaParse()

//        data = [Semana(nombreSemana: "Semana1")
//            , Semana(nombreSemana: "Semana2")
//            
//        ]
        
//        data = semanaParse.getAllSemana()
//        var nom:String!
//        nom = data[0].nombreSemana
//        print(nom)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    //metodos DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell: SemanaTableViewCell = tableView.dequeueReusableCellWithIdentifier("celda") as! SemanaTableViewCell
        
        let cell: SemanaTableViewCell = tableView.dequeueReusableCellWithIdentifier("celda") as! SemanaTableViewCell
        
        let pos = indexPath.row
        
        
       // cell.nombreSemana.text = data[pos].nombreSemana
       cell.nombreSemana.text = data[pos].nombreSemana
        
         
        return cell
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
