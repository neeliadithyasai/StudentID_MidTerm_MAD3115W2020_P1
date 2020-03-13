//
//  Internet.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-12.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Internet: Bill {
    var providerName = String()
    var internetUsed: Int=0
    
    
    init(billId: String, billDate: Date, billType: BillType, billAmount: Double,providerName:String,internetUsed:Int) {
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
        
        self.providerName = providerName
        self.internetUsed = internetUsed
        
    }
    
    override func display() {
        super.display()
        print("         Provider Name is : \(providerName)")
        print("".gbConsumed(internetUsed: internetUsed))
        print("         ***************************************************")
    }
    
    
}
