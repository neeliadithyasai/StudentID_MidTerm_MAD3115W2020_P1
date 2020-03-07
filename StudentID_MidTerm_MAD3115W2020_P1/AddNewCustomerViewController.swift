//
//  AddNewCustomerViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController {

    @IBOutlet weak var txtCustomerId: UITextField!
    
    @IBOutlet weak var txtFirstname: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmailId: UITextField!
    
    override func viewDidLoad() {
      super.viewDidLoad()

    }
    
    @IBAction func btnAddCustomer(_ sender: UIButton)
    {
        
            if let id = txtCustomerId.text, let fn = txtFirstname.text , let ln = txtLastName.text, let em = txtEmailId.text
                 {
                    if txtCustomerId.text == "" || txtFirstname.text == "" || txtLastName.text == ""
                    {
                        let alertController = UIAlertController(title: "Incomplete data", message: "Please check all fields ", preferredStyle: .alert)
                                         let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                                     
                                         alertController.addAction(defaultAction)
                                         self.present(alertController, animated: true, completion: nil)
                        }
                    else{
                        do{
                            DataStorage.getInstance().addCustomer(customer:try Customer(customerId: "\(id)", firstName: "\(fn)", lastName: "\(ln)", email: "\(em)"))
                        }
                        catch validEmail.invalidEmail(let Problem)
                                  {
                                       let alertController = UIAlertController(title: "Invalid email", message: "Please check emailId ", preferredStyle: .alert)
                                                                              let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                                                                          
                                                                              alertController.addAction(defaultAction)
                                                                              self.present(alertController, animated: true, completion: nil)
                                      }
                          catch {
                                      print("Unrecognised Error")
                                             }
                                
            }
        }
      
                    
            }
            
    }
    
    

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


