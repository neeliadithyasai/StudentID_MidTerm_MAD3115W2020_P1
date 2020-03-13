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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Bill", style: .plain, target: self, action: #selector(addTapped))
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
            customerInfo.text = "Customer ID : \(id)\n\nCustomer Name : \(fn)\n\nCustomer Email : \(em)\n\nTotal Bill : \(am)"
            customerInfo.numberOfLines = 0
            customerInfo.font = UIFont.boldSystemFont(ofSize: 16)
            customerInfo.backgroundColor = UIColor.white
            customerInfo.textColor = UIColor.black
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
            customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)\nTotal Bill : \(am)"
            customerInfo.numberOfLines = 0
            customerInfo.font = UIFont.boldSystemFont(ofSize: 17)
            customerInfo.backgroundColor = UIColor.blue
            customerInfo.textColor = UIColor.green
            self.Bills = (customerBill?.getBills())!
            self.tblBillsView.reloadData()
        }
    }
    @objc func addTapped(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let VC = sb.instantiateViewController(identifier: "addBillCell") as? AddBillViewController {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    
    
}



extension billDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (customerBill?.getBills().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        let bill = Bills[indexPath.row]
        if bill.billId.contains("INT"){
            
            
            let str = bill.billDate.formatDate()
            cell.textLabel?.text = "Bill Id : \(bill.billId)\nBill Type : Internet\nBill Date : \(str)\nBill Amount : \(bill.billAmount)"
            cell.textLabel?.numberOfLines = 0
            
           
        }
        if bill.billId.contains("HYD"){
          
            
            let str = bill.billDate.formatDate()
            cell.textLabel?.text = "Bill Id : \(bill.billId)\nBill Type : Hydro\nBill Date : \(str)\nBill Amount : \(bill.billAmount)"
            cell.textLabel?.numberOfLines = 0
            
            
        }
        
        if bill.billId.contains("MOB"){
            
            
            let str = bill.billDate.formatDate()
            cell.textLabel?.text = "Bill Id : \(bill.billId)\nBill Type : Mobile\nBill Date : \(str)\nBill Amount : \(bill.billAmount)"
            cell.textLabel?.numberOfLines = 0
            
            
            
        }
        
        return cell
        
        
        
    }
}
