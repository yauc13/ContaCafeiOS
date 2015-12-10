//
//  VerInsumoViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/10/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class VerInsumoViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var TablaInsumo: UITableView!
    
    var data:[Insumo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [Insumo(nombreInsumo: "Abono", costoInsumo: 30000)
            , Insumo(nombreInsumo: "Cal", costoInsumo: 45000)
        ]

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
        
        let cell: InsumoTableViewCell = tableView.dequeueReusableCellWithIdentifier("celdaInsumo") as! InsumoTableViewCell
        
        let pos = indexPath.row
        
        
        // cell.nombreSemana.text = data[pos].nombreSemana
        cell.nombreInsumo.text = data[pos].nombreInsumo
        cell.costoInsumo.text = data[pos].costoInsumo as? String
        
        
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
