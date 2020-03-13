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
        
        self.Bills = (customerBill?.getBills())!
        self.navigationItem.title = "Bill Details"
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor.gray
        navBar?.isTranslucent = true
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Bill", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
            let formatAmount = "\(am)".formatCurrency()
            customerInfo.text = "  Customer ID          :    \(id)\n\n  Customer Name  :    \(fn)\n\n  Customer Email   :    \(em)\n\n  Total Bill                   :     \(formatAmount)"
            customerInfo.numberOfLines = 0
            customerInfo.font = UIFont.boldSystemFont(ofSize: 16)
            customerInfo.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            customerInfo.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.Bills = (customerBill?.getBills())!
            self.tblBillsView.reloadData()
        }
    }
    
    @objc func addTapped(){
        let choice = customerBill!
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let VC = sb.instantiateViewController(identifier: "addBillCell") as? AddBillViewController {
            self.navigationController?.pushViewController(VC, animated: true)
            VC.selectedCustomer = choice
        }
    }
}
extension billDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        if (section == 0) {
            headerView.backgroundColor = UIColor.systemRed
        } else {
            headerView.backgroundColor = UIColor.clear
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (customerBill?.getBills().count)!
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        let bill = Bills[indexPath.row]
        
        if bill.billId.contains("INT"){
            let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id                 :   \(bill.billId)\nBill Type           :   Internet\nBill Date           :   \(str)\nBill Amount     :   \(formatBillAmount)"
            cell.textLabel?.numberOfLines = 0
        }
        
        if bill.billId.contains("HYD"){
            let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id                 :   \(bill.billId)\nBill Type           :   Hydro\nBill Date           :   \(str)\nBill Amount     :   \(formatBillAmount)"
            cell.textLabel?.numberOfLines = 0
        }
        
        if bill.billId.contains("MOB"){
            let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id                 :   \(bill.billId)\nBill Type           :   Mobile\nBill Date           :   \(str)\nBill Amount     :   \(formatBillAmount)"
            cell.textLabel?.numberOfLines = 0
            
            
            
        }
        return cell
    }
    
   func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0){
           cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8431372549, blue: 0.8588235294, alpha: 1)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }

    
}
