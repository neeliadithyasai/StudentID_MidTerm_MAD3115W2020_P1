//
//  Bill.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
import Foundation
enum BillType{
    case Mobile, Internet, Hydro, Insurance
}

class Bill:IDisplay{
    
     var billId: String
     var billDate: Date
     var billType: BillType?
     var billAmount: Double
    
    init(billId: String,billDate: Date,billType: BillType, billAmount: Double) {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.billAmount = billAmount
    }
    func display() {
        
        print("         Bill ID : \(billId)")
        let str = billDate.formatDate(date: billDate)
        print("         Bill Date : \(str)")
        print("         Bill Type : \(billType!)")
        let d = "".formatCurrency(billAmount: billAmount)
        print("         Bill Amount : \(d)")
        
    }
  }
