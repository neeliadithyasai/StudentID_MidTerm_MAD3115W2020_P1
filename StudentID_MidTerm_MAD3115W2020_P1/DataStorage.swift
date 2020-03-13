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
            let C1 = try Customer(customerId: "C301", firstName: "rob", lastName: "stark", email: "rob.s@gmail.com")
            let C2 = try Customer(customerId: "C302", firstName: "simon", lastName: "baker", email: "simon@yahoo.com")
            let C3 = try Customer(customerId: "C303", firstName: "taylor", lastName: "hues", email: "taylor123@gmail.IO")
            customers.append(C1)
            customers.append(C2)
            customers.append(C3)
            let calendar = Calendar.current
            
            let h1 = DateComponents(calendar: calendar, year: 2020, month: 01, day: 10)
            let hd1 = calendar.date(from: h1)
            let H1 = Hydro(billId: "HYD001", billDate: hd1!, billType: BillType.Hydro, billAmount: 320.90, agencyName: "T Hydro", unitsConsumed: 250)
            C1.bills.updateValue(H1, forKey: "H")
            
            let m1 = DateComponents(calendar: calendar, year: 20200, month: 02, day: 23)
            let md1 = calendar.date(from: m1)
            let M1 = try Mobile(billId: "MOB101", billDate: md1!, billType: BillType.Mobile, billAmount: 150.53, modelName: "Apple XR", mobileNumber: "9089765646", internetUsed: 16, minuteUsed: 371, planName: "5 GB Eco Deal")
            bills.updateValue(M1, forKey: "MOB101")
            C1.bills.updateValue(M1, forKey: "M")
            
            let i1 = DateComponents(calendar: calendar, year: 2019, month: 08, day: 06)
            let id1 = calendar.date(from: i1)
            let I1 = Internet(billId: "INT001",billDate: id1!, billType: BillType.Internet, billAmount: 65.9, providerName: "Fido", internetUsed: 100)
            bills.updateValue(I1, forKey: "INT001")
            C2.bills.updateValue(I1, forKey: "I")
            
            let m2 = DateComponents(calendar: calendar, year: 2020, month: 09, day: 16)
            let md2 = calendar.date(from: m2)
            let M2 =  try Mobile(billId: "MOB102", billDate: md2!, billType: BillType.Mobile, billAmount: 74.40, modelName: "Samsung S20", mobileNumber: "897656538", internetUsed: 17, minuteUsed: 130,planName: "Double Gig Unlimited + Talk 14 GB")
            bills.updateValue(M2, forKey: "MOB102")
            C2.bills.updateValue(M2, forKey: "M")
            
            let h2 = DateComponents(calendar: calendar, year: 2018, month: 07, day: 09)
            let hd2 = calendar.date(from: h2)
            let H2 = Hydro(billId: "HYD002", billDate: hd2!, billType: BillType.Hydro, billAmount: 500.25, agencyName: "Hudson Bay Hydro", unitsConsumed: 376)
            bills.updateValue(H2, forKey: "HYD002")
            C2.bills.updateValue(H2, forKey: "H")
            
            let h3 = DateComponents(calendar: calendar, year: 2019, month: 06, day: 25)
            let hd3 = calendar.date(from: h3)
            let H3 = Hydro(billId: "HYD003", billDate: hd3!, billType: BillType.Hydro, billAmount: 178.98, agencyName: "Tyrant Utilities", unitsConsumed: 295)
            bills.updateValue(H3, forKey: "HYD003")
            C3.bills.updateValue(H3, forKey: "H")
            
        }catch validEmail.invalidEmail(Problem: "email"){
            print("Invalid Email Address")
            
        }
        catch {
            print("Unrecognised Error")
        }
        
        
    }
}
