//
//  MapViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var location = CLLocationCoordinate2DMake(2.452625, -76.598016)
        
        var span = MKCoordinateSpanMake(0.02, 0.02)
        
        var region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Mobile Lab Colombia"
        
        annotation.subtitle = "Popayan"
        
        Map.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
