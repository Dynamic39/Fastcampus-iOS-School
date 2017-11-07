//: Playground - noun: a place where people can play

import UIKit



/*
연습문제 
 if & for
윤년 구하는 문제: 윤년은 기본적으로 매 4년마다 돌아오나, 100으로 나눠떨어지는 해는 윤년이 아니며 그중 400으로 나눠 떨어지는 해는 윤년이다

1. check(leapYear:1955) // check(leepYear:2000)
2. 리턴결과 : "1955년은 윤년이 아닙니다 " // "2000년은 윤년입니다"
 
*/



func leapYear(year :Int) -> Bool {
    
    if year % 4 == 0 {
        if year % 100 != 0 || year % 400 == 0 {
            
            print("윤년입니다")
            return true
            } else {
            
            print("윤년이아닙니다")
            return false
        }
        
    }else{
        print("윤년이 아닙니다")
        
        return false
    }
}

var check = leapYear(year: 2000)


/*
 연습문제
 if & for

 각자리수 더하기
 
 1. 함수입력 addAllDigit(num :123), 
 2. 리턴 결과 6

 
 */


func addAllDigit(num :Int) -> Int {
    

    var num = num
    var positionNumber = 0
    
    while num > 0 {

        positionNumber += num % 10
        num /= 10
        
    }
    
    return positionNumber
    
}

var check1 = addAllDigit(num: 5792)
print(check1)



/*
 
 숫자 거꾸로
 
 ex 123 -> 321
 
 */






