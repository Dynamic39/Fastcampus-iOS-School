//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func insertArray(num :Int) -> Array<Any> {
    
    var result: [Int] = []
    var num = num
    
    while 0 < num {
        var temp1: Int = 0
        temp1 = num % 10
        result.insert(temp1, at: 0)
        
        num = num / 10
        
    }
    
    return result
}

print(insertArray(num: 123131241))




import Foundation

func solution(n:Int) -> Int
{
    var divideDigit: [Int] = []
    var answer:Int = 0
    var num = n
    while 0 < num
    {
        var temp1: Int = 0
        temp1 = num % 10
        num /= 10
        divideDigit.append(temp1)
    }
    
    for i in 0..<divideDigit.count
    {
        answer += divideDigit[i]
    }
    
    return answer
}

print(solution(n:123))
print(solution(n:987))