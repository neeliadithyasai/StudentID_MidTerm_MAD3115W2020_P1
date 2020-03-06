//
//  Customer.swift
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
    lazy var bills : [String:Bill]=[:]
    lazy var totalBill: Double = calculatedBill()
    

    init(customerId:String, firstName: String, lastName: String, email: String){
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        
//        guard email.isValidEmail else {
//            validEmail.invalidEmail(Problem: "\(email)")
//        }
//    
        self.email = email
    }
    func calculatedBill() -> Double{
        var t = 0.0
        for(_,v) in bills{
            t = t + v.billAmount
        }
        return t
    }
    
    func display(){
        print("Customer ID : \(customerId)")
        print("Customer Full Name : \(fullName)")
        if email.isValidEmail{
            print("Customer Email ID : \(email)")}
        print("         ------------Bill Information-------------    ")
        print("         ***************************************************")
        for bill in bills{
            bill.value.display()
        }
        let t = "".formatCurrency(billAmount: calculatedBill())
        print("                  Total Bill Amount : \(t)")
        print("         ***************************************************")
        print(" ")
    }
  }
