//
//  customer.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//
import Foundation

enum validEmail: Error{
    case invalidEmail(Problem : String)
}

class Customer: IDisplay {
    var customerId: String
    var firstName: String
    var lastName: String
    var fullName: String{
        return "\(firstName) \(lastName)"
    }
    var email: String
    lazy var customerBills : [String:Bill]=[:]

    lazy var totalBill: Double = calculatedBill()
    
    //https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
    init(customerId:String, firstName: String, lastName: String, email: String)throws {
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        
        guard email.isValidEmail else{
            throw validEmail.invalidEmail(Problem: "email")
        }
        self.email = email

    }
    func getBills() -> [Bill]{
        var bills = [Bill]()
        for i in customerBills{
            bills.append(i.value)
        }
        return bills
    }

    func calculatedBill() -> Double{
        var t = 0.0
        for(_,v) in customerBills{
            t = t + v.billAmount
        }
        return t
    }
    
    func display(){
//        print("Customer ID : \(customerId)")
//        print("Customer Full Name : \(fullName)")
//        if email.isValidEmail{
//            print("Customer Email ID : \(email)")}
//        print("         ------------Bill Information-------------    ")
//        print("         ***************************************************")
//        for bill in bills{
//            bill.value.display()
//        }
//        let t = "".formatCurrency(billAmount: calculatedBill())
//        print("                  Total Bill Amount : \(t)")
//        print("         ***************************************************")
//        print(" ")
    }
  }
