//
//  VerSemanaLocalViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/13/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class VerSemanaLocalViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var TablaSemanaLocal: UITableView!
    
    
    var data:[Semana]!
    var semanaDao:SemanaDao!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        semanaDao = SemanaDao()
        data = semanaDao.getAll()


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
        
        let cell: SemanaLocalTableViewCell = tableView.dequeueReusableCellWithIdentifier("celda") as! SemanaLocalTableViewCell
        
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
