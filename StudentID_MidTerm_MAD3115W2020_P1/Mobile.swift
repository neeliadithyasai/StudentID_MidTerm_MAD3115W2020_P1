//
//  Mobile.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-13.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

enum mobileCount: Error{
    case invalidMobile(error: String)
}

class Mobile: Bill
{
    var modelName: String?
    var mobileNumber: String = ""
    var planName: String = ""
    var internetUsed: Int=0
    var minuteUsed: Int=0
    
    
    init(billId: String, billDate: Date, billType: BillType, billAmount: Double,modelName: String, mobileNumber: String, internetUsed: Int, minuteUsed: Int,planName: String) throws {
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
        self.modelName = modelName
        
        guard mobileNumber.count == 10
            else {
                throw mobileCount.invalidMobile(error: "\(mobileNumber)")
        }
        self.mobileNumber = mobileNumber
        self.planName = planName
        self.internetUsed = internetUsed
        self.minuteUsed = minuteUsed
    }
    
    
    override func display() {
        super.display()
        print("         Manufacturer Name : \(self.modelName!)")
        print("         Mobile Number : \(self.mobileNumber)")
        print("         Plan name is: \(self.planName)")
        print("".gbConsumed(internetUsed: internetUsed))
        var q = ""
        q = q.minUsed(minutesUsed: minuteUsed)
        print(q)
        print("         ***************************************************")
    }
}
