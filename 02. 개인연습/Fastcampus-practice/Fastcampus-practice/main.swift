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
    
    
    
    
    
    return ""
    
}
