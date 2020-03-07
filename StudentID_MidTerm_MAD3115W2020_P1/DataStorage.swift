//
//  DataStorage.swift
//  StudentID_MidTerm_MAD3115W2020_P1
//
//  Created by adithyasai neeli on 2020-03-06.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
class DataStorage {
    static private let instance = DataStorage()
    private lazy var customers : [Customer] = []
    private init(){
        
    }
    static func getInstance()->DataStorage{
        return instance
    }
    
    func addCustomer(customer: Customer){
        self.customers.append(customer)
    }
    func getAllCustomers()->[Customer]{
        return self.customers
    }
    
   func loadCustomers(){
        do{
            customers.append(try Customer(customerId: "C301", firstName: "Steven", lastName: "Gerrard", email: "sgerrard@gmail.com"))
            customers.append(try Customer(customerId: "C302", firstName: "Sadio", lastName: "Mane", email: "Sadiom@yahoo.com"))
            customers.append(try Customer(customerId: "C303", firstName: "Jordan", lastName: "Henderson", email: "jorhen@gmail.IO"))
    
        }catch validEmail.invalidEmail(Problem: "email"){
         print("Invalid Email Address")
    
        }
         catch {
          print("Unrecognised Error")
    }

}
}
