//
//  Hydro.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-13.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Hydro: Bill {
    
    var agencyName: String?
    var unitsConsumed: Int = 0
    
    
    
    init(billId: String, billDate: Date, billType: BillType, billAmount: Double, agencyName: String,unitsConsumed: Int) {
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
        
        self.agencyName = agencyName
        self.unitsConsumed = unitsConsumed
        
    }
    
    override func display() {
        super.display()
        print("         Agency Name : \(agencyName!)")
        print("" .formatUnit(unitsConsumed: unitsConsumed))
        print("         ***************************************************")
    }
}
