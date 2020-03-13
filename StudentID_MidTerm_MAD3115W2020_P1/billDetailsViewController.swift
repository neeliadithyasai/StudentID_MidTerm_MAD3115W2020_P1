//
//  billDetailsViewController.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class billDetailsViewController: UIViewController {

    @IBOutlet weak var customerInfo: UILabel!

    @IBOutlet weak var btnViewBills: UIButton!
    
    @IBOutlet weak var lblBillDetails: UILabel!
    @IBOutlet weak var tblBillsView: UITableView!
    
    
    lazy var Bills : [Bill] = []
    var customerBill : Customer?
    override func viewDidLoad() {
           super.viewDidLoad()
           self.navigationItem.title = "Bill Details"
           let navBar = self.navigationController?.navigationBar
           navBar?.barTintColor = UIColor.white
           navBar?.isTranslucent = true
           navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
         customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)\nTotal Bill : \(am)"
        customerInfo.numberOfLines = 0
        customerInfo.font = UIFont.boldSystemFont(ofSize: 17)
            customerInfo.backgroundColor = UIColor.white
            customerInfo.textColor = UIColor.black
        }
          
//           if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email
//           {
//               customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)"
//               customerInfo.numberOfLines = 0
//
//              if let abc = customerBill?.bills
//              {
//                if abc.count > 0
//                {
//                   for(_,v) in abc
//                   {
//                    lblBillDetails.text = " Bill ID : \(v.billId)\n Bill Type: \(v.billType!)\n Bill Date :\(v.billDate)\n Bill Amount:\(v.billAmount) "
//                    lblBillDetails.numberOfLines = 0
//
//                  }
//               }
//
//
//            }
     }
        
        
    
    
}
   
//    @IBAction func btnActnViewBills(_ sender: UIButton) {
//
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//
//        if let viewController = sb.instantiateViewController(identifier: "billsView") as? billsViewController {
//            navigationController?.pushViewController(viewController, animated: true)
//    }
    

    //}

extension billDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 0{
            label.text = "Internet"
            label.backgroundColor = UIColor.lightGray
        }
        else if section == 1 {
            label.text = "Hydro"
            label.backgroundColor = UIColor.lightGray
        }
        else {
            label.text = "Mobile"
            label.backgroundColor = UIColor.lightGray
        }
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
       
        
        if indexPath.section == 0{
            
            let exists = customerBill?.bills["I"] != nil
            if exists{
                let v = customerBill?.bills["I"]
                let str = v?.billDate.formatDate()
                cell.textLabel?.text = "Bill Id : \(v!.billId)\nBill Type : Internet\nBill Date : \(str!)\nBill Amount : \(v!.billAmount)"
                cell.textLabel?.numberOfLines = 0
            }
            else {
                cell.textLabel?.text = "No bill"
            }
        }
        if indexPath.section == 1{
            let exists = customerBill?.bills["H"] != nil
            if exists{
                let v = customerBill?.bills["H"]
                let str = v?.billDate.formatDate()
                cell.textLabel?.text = "Bill Id : \(v!.billId)\nBill Type : Internet\nBill Date : \(str!)\nBill Amount : \(v!.billAmount)"
                cell.textLabel?.numberOfLines = 0
            }
            else {
                cell.textLabel?.text = "No bill"
            }
        }
        
        if indexPath.section == 2
        {
            let exists = customerBill?.bills["M"] != nil
            if exists{
                let v = customerBill?.bills["M"]
                let str = v?.billDate.formatDate()
                cell.textLabel?.text = "Bill Id : \(v!.billId)\nBill Type : Internet\nBill Date : \(str!)\nBill Amount : \(v!.billAmount)"
                cell.textLabel?.numberOfLines = 0
            }
            else {
                cell.textLabel?.text = "No bill"
            }
        }
        return cell
        
    }
}
