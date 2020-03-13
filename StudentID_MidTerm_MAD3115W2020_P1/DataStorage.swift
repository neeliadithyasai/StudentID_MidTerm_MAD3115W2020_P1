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
    private lazy var bills = Dictionary<String, Bill>()
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
            let C1 = try Customer(customerId: "C301", firstName: "Steven", lastName: "Gerrard", email: "sgerrard@gmail.com")
            let C2 = try Customer(customerId: "C302", firstName: "Sadio", lastName: "Mane", email: "Sadiom@yahoo.com")
            let C3 = try Customer(customerId: "C303", firstName: "Jordan", lastName: "Henderson", email: "jorhen@gmail.IO")
            customers.append(C1)
            customers.append(C2)
            customers.append(C3)

            let calendar = Calendar.current
            let i1 = DateComponents(calendar: calendar, year: 2019, month: 10, day: 26)
            let id1 = calendar.date(from: i1)
            let I1 = Internet(billId: "INT001",billDate: id1!, billType: BillType.Internet, billAmount: 55.9, providerName: "Rogers", internetUsed: 154)
            bills.updateValue(I1, forKey: "INT001")
            C1.bills=["b1": I1]
        
//            let h1 = DateComponents(calendar: calendar, year: 2020, month: 01, day: 10)
//            let hd1 = calendar.date(from: h1)
//            var H1 = Hydro(billId: "HYD001", billDate: hd1!, billType: BillType.Hydro, billAmount: 280.90, agencyName: "Saint John Energy", unitsConsumed: 350)
            
    
        }catch validEmail.invalidEmail(Problem: "email"){
         print("Invalid Email Address")
    
        }
         catch {
          print("Unrecognised Error")
    }

}
}
