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
            customers.append(try Customer(customerId: "C001", firstName: "michael", lastName: "stuart", email: "stuartm@gmail.com"))
            customers.append(try Customer(customerId: "C001", firstName: "Robin", lastName: "Matthew", email: "robinm@yahoo.com"))
        
    }catch validEmail.invalidEmail(let Problem){
        print("Invalid Email Address : \(Problem)")
    }
    catch {
        print("Unrecognised Error")
    }
}

}
