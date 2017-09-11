//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func reverse(num :Int) -> Int {
    
    var num = num
    var positionString = ""
    
    while num > 0 {
        
        positionString += String(num % 10)
        num = num / 10
        
    }
    return Int(positionString)!
    
}

var check2 = reverse(num: 456)
print(check2)
