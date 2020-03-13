//
//  StringExtension.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation


extension String{
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    func formatCurrency() -> String{
        return "$\(self)"
    }
    func formatUnit(unitsConsumed: Int)->String{
        return "         Units Consumed : \(unitsConsumed) Units "
    }
    
    func gbConsumed(internetUsed: Int)->String{
        return "         Internet consumed : \(internetUsed) GB "
    }
    func minUsed(minutesUsed: Int)->String{
        return "         Minutes Usage : \(minutesUsed) minutes "
    }
    func toDate(withFormat format: String = "EEEE, dd MMMM, yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}




