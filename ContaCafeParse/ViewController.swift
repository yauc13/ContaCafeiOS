//
//  ViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/7/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        if(!isUserLoggedIn){
            self.performSegueWithIdentifier("loginView", sender: self);
            
        }
        
    }
    
    @IBAction func logoutButtontapped(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("loginView", sender: self);
    }
}


