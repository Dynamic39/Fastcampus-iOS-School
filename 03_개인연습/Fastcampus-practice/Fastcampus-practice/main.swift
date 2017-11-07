//
//  main.swift
//  Fastcampus-practice
//
//  Created by Samuel K on 2017. 9. 12..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

/*
 요일 구하기
 2017년도 1월 1일은 일요일
 내가 원하는 월일을 받아서 해당날의 요일을 구하는 함수 만들기
 */

func getWeekDay(atMonth: Int, day: Int) -> String {
    
    var eachMonthDays:[Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var days:[String] = ["일", "월", "화", "수", "목", "금", "토"]
    var countDays: Int = day

    
    for i in 0..<atMonth {
        
        countDays = countDays + eachMonthDays[i]
        
    }
    
    countDays = countDays % 7 - 3
    
    let checkTheToday: String = days[countDays]
    
    
    return "오늘은 \(atMonth)월 \(day)일 \(checkTheToday)요일 입니다 ^_^"
    
}


print(getWeekDay(atMonth: 11, day: 1))

/*
 
 앞자리 중복 숫자 줄이기
 
 */

func shoter(num: Int) -> String {
    
    var num = num
    var originalArray = [Int]()
    var appendedArray = [Int]()
    var resultArray = [Int]()
    
    while 0 < num {
        
        originalArray.append(num%10)
        
        num = num / 10
        
        print(originalArray)
    }
    
    while 0 < originalArray.count {
        appendedArray.append(originalArray.last!)
        originalArray.removeLast()
    }

    print(appendedArray)
    
    resultArray.append(appendedArray[0])
    
    for i in 1..<appendedArray.count {
        
        if appendedArray[i] != appendedArray[i-1] {
            resultArray.append(appendedArray[i])
        }
        
    }
    return "\(resultArray)"

}

print(shoter(num: 1002233422))

/*
 
 입력된 숫자의 모든 소수 반환
 
 */



