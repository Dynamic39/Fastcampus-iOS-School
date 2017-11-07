//
//  main.swift
//  0915-fastcampus
//
//  Created by Samuel K on 2017. 9. 15..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

print("Hello, World!")

var total:Int = 107
var average:Double = 0
average = Double(total) / 5

print(average)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a=b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)


var a: (Int, Int, Int) = (10, 10, 30)

func testCase(someStr: String){
    
    switch someStr {
    case "a":
        print("A를 선택하였습니다")
    case "c":
        print("C를 선택하였습니다.")
    default:
        print("해당하는 문자열이 없습니다.")
    }
    
    
    
}

print(testCase(someStr: "B"))




