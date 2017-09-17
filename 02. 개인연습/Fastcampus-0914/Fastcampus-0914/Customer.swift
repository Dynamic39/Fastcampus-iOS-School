//
//  Customer.swift
//  Fastcampus-0914
//
//  Created by Samuel K on 2017. 9. 14..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation



class Customer {
    
    let name: String
    var address: String
    
    var total: Int = 0
    
    var accouts: [Account] = []
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    func totalAmmount() -> Int {
        
        
        
        for account in accouts {
            
            total += account.ammount
            
        }
        
        return total
    }
}


var (a, b) = (3, 5)

func cal(num1: Int, num2:Int) -> (Int, Int) {
    
    let sum = num1 + num2
    let minus = num1 - num2
    
    return (sum, minus)
}










