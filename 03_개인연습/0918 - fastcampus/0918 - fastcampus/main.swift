//
//  main.swift
//  0918 - fastcampus
//
//  Created by Samuel K on 2017. 9. 18..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

print("Hello, World!")



//스위치문 사용

func getGrade2(withPoint point:Int) -> String
{
    var grade:String = "F"
    switch point
    {
    case let p where (p <= 100 && p > 90):
        grade = "A"
    case let p where (p <= 90 && p > 80):
        grade = "B"
    case let p where (p <= 80 && p > 70):
        grade = "C"
    case let p where (p <= 70 && p > 60):
        grade = "D"
    default:
        grade = "F"
    }
    
    return grade
    
}

print(getGrade2(withPoint: 70))



func getGrade(withPoint point:Double) -> String
{
    var grade:String = "F"
    switch point
    {
    case 95...100:
        grade = "A+"
    case 90..<95:
        grade = "A"
    case 85..<90:
        grade = "B+"
    case 80..<85:
        grade = "B"
    default:
        grade = "F"
    }
    
    return grade
    
}

print(getGrade(withPoint: 80.9))


struct FixedLenthRange {
    var firstValue: Int
    let length: Int
}


var rangeOfThreeItems = FixedLenthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems)


struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

// Prints "The point is now at (3.0, 4.0)’


enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode:Barcode = Barcode.upc(3, 334, 50004, 3040)
productBarcode = .qrCode("DJAKSJLD")
productBarcode = .upc(3, 334, 50004, 3040)


switch productBarcode {
    
case .upc(let numberSystem, let manufacture, let product, let check) :
    print("UPC : \(numberSystem), \(manufacture), \(product), \(check)")
    
case .qrCode(let productCode) :
    print("Barcode : \(productCode)")
    
}


enum School {
    case student, taecher, textbook, score, grade, playground
}

enum computer {
    case hardware(String, String, String, String)
    case software(Double, Int, Int, Int)
}

var i7Computer:computer = computer.hardware("i7 프로세서", "DDR5 RAM", "Samsung SSD", "PWON Supply System")
i7Computer = .software(3.33, 16, 512, 600)
i7Computer = .hardware("i7 7세대", "DDR6", "Toshiba", "파워")


switch i7Computer {
case .hardware(let processor, let systemRam, let SSDmaker, let supplyMaker):
    print("HW -> \(processor), \(systemRam), \(SSDmaker), \(supplyMaker)")
case .software(let cpulevel, let ramCapacity, let SSDCapacity, let powerLevel):
    print("SW -> CPU클럭 : \(cpulevel)Ghz, Ram 용량 : \(ramCapacity)GB, SSD 용량 : \(SSDCapacity)GB, 파워 : \(powerLevel)W")
    
}


enum Planet: Int{
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var possiblePlanet:Planet = Planet(rawValue: 1)!
possiblePlanet = Planet(rawValue: 3)!

print(possiblePlanet)



enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

var ASCII: ASCIIControlCharacter = ASCIIControlCharacter(rawValue: "\t")!

func test(num:Int) -> Int
{
    var total: Int = num
    
    if num == 0
    {
        return 1
    }
    
    total *= test(num: num-1)
    
    return total
}

var testPrint = test(num: 5)
print(testPrint)


//피보나치 수열 만들기
//Fibonacci -> 1, 1, 2, 3, 5, 8, 13
//Fibonacci(num: ) 을 했을때 몇번째인지?

func fibonacci(num: Int) -> Int
{
    
    if num == 1 || num == 2 {return 1}
    
    return fibonacci(num: num - 1) + fibonacci(num: num - 2)

}

print(fibonacci(num: 7))










