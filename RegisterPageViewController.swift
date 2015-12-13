//
//  RegisterPageViewController.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        // verificar que los campos esten llenos
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty)
        {
            //Mensaje de Alerta
            
            displayMyAlertMessage("Todos los campos son Necesarios");
            
            return;
            
        }
        //Verificar si la contraseña es igual
        if(userPassword != userRepeatPassword){
            // Mensaje de Alerta
            displayMyAlertMessage("Las contraseñas no coinciden");
            
            return;
        }
        // Almacenamiento de Datos
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        // Mensaje de confirmacion
        var myAlert = UIAlertController(title: "Alerta", message: "Registro Correcto", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "oK", style: UIAlertActionStyle.Default){
            action in self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "oK", style: UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
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
