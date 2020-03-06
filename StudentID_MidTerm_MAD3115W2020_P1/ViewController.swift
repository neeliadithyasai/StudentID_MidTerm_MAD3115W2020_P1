//
//  ViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-05.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    
    let email = "admin"
    let password = "admin123"

    
    @IBOutlet weak var txtLogin: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBOutlet weak var btnRememberme: UISwitch!
    
    @IBOutlet weak var btnLogin: UIBarButtonItem!
    
    
    @IBOutlet weak var trial: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ud = UserDefaults.standard
        let em = ud.string(forKey: "email")
        let pass = ud.string(forKey: "password")

        if let email = em {
            txtLogin.text = "\(email)"
        }

        if let password = pass {
            txtPassword.text = "\(password)"
        }
      
    }
    
    @IBAction func btnLogin(_ sender: UIBarButtonItem)
    {
        
        
        
//                if txtLogin.text == email && txtPassword.text == password{
//                    if btnRememberme.isOn == true {
//                        UserDefaults.standard.set(txtLogin.text!, forKey: "email")
//                        UserDefaults.standard.set(txtPassword.text!, forKey: "password")
//                    }
//                    performSegue(withIdentifier: "segue", sender: self)
//                }
//                else{
//                    let alertController = UIAlertController(title: "ERROR", message:
//                        "Access Denied", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
//        
//                    self.present(alertController, animated: true, completion: nil)
//            }
    }
   
    
    


}

