//
//  CustomerTableViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    @IBOutlet weak var tblCustomers: UITableView!
    
    
  
    lazy var customerNames : [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerNames = DataStorage.getInstance().getAllCustomers()
        self.navigationItem.title = "Customer"
        //self.navigationItem.hidesBackButton = true;
        // Do any additional setup after loading the view.
    }
   
}
extension CustomerViewController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return customerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
        let customer = customerNames[indexPath.row]
        cell?.textLabel?.text = customer.fullName
        
        return cell!
        
    }
            
    }
    
