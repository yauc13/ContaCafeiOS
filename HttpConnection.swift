//
//  HttpConnection.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/13/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//


import Foundation
class HttpConnection{
    
    func requestByGet(url:String, callback:(txt:String?, error:NSError?)->Void){
        
        let urlF = NSURL(string:url)
        let request = NSMutableURLRequest(URL: urlF!)
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request){(data:NSData?, response:NSURLResponse?, error:NSError?)->Void in
            
            if(error == nil){
                
                let txtJ:String? = NSString(data: data!, encoding: NSUTF8StringEncoding) as? String
                callback(txt:txtJ, error:error)
            }else{
                callback(txt: nil, error: error)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func requestByPost(url:String, data:String, callback:(txt:String?, error:NSError?)->Void){
        
        let urlF = NSURL(string:url)
        let request = NSMutableURLRequest(URL: urlF!)
        
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataE = data.dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPBody = dataE
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){(data:NSData?, response:NSURLResponse?, error:NSError?)->Void in
            
            if error == nil{
                let txt:String? = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String
                callback(txt: txt, error: error)
            }else{
                callback(txt:nil, error: error)
            }
            
            
        }
        
        task.resume()
        
        
    }
    
}
