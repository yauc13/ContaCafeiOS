//
//  ClimaViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/13/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class ClimaViewController: UIViewController {
    
    @IBOutlet var pronostico: UILabel!
    @IBOutlet var temperatura: UILabel!
    @IBOutlet var humedad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client:HttpConnection = HttpConnection()
        client.requestByGet("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22popayan%2C%20co%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys") { (txt, error) -> Void in
            
            if(txt != nil){
                self.processTxt(txt!)
            }
            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func processTxt(txt:String){
        
        let data:NSData! = txt.dataUsingEncoding(NSUTF8StringEncoding)!
        
        do{
            
            let info:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            let query:NSDictionary = info.objectForKey("query") as! NSDictionary
            let results:NSDictionary = query.objectForKey("results") as! NSDictionary
            let channel:NSDictionary = results.objectForKey("channel") as! NSDictionary
            let atmosphere:NSDictionary = channel.objectForKey("atmosphere") as! NSDictionary
            
            let h:String = atmosphere.objectForKey("humidity") as! String
            humedad.text = h
            
            
            let item:NSDictionary = channel.objectForKey("item") as! NSDictionary
            let condition:NSDictionary = item.objectForKey("condition") as! NSDictionary
            
            let temp:String = condition.objectForKey("temp") as! String
            temperatura.text = temp
            
            let p:String = condition.objectForKey("text") as! String
            pronostico.text = p
            
            
        }catch{
        }
        
        
        
    }
    
    
}

