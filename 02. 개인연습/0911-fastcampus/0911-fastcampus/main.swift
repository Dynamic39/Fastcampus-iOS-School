

/*
 1. inch to cm, cm to inch
 2. m2 to 평, 평 to m2 
 3. 화시 to 섭씨, 섭씨 to 화씨
 4. data량(KB to MB, MB to GB)
 5. 시간(hhmmss)을 받으면 초단위로 변경 초단위를 시간으로 변경
    110320 >> 4400초
*/



func changeBeetweenInchToCenti(type: String, value: Double) -> Double {
    
    var result: Double = 0
    
    if type == "inch" {
        result = value / 2.54
    }else if type == "centi" {
        result = value * 2.54
    }else{
        return -1
    }
    
    return result
    
}

var inchToCenti = changeBeetweenInchToCenti(type: "inch", value: 500)

print(inchToCenti)

func chnageM2ToPyoung(type: String, value: Double) -> String {

    var result: Double = 0
    
    if type == "M2" {
        result = value * 3.305785
    }else if type == "Py" {
        result = value / 3.305785
    }else{
        return "type입력값 오류 입니다. 타입 입력에 m2 or py(평)을 입력하여 주십시오"
    }
    
    return "전환 결과 \(result) \(type)로 확인되었습니다."
    
}

var m2ToPyoung = chnageM2ToPyoung(type: "M2", value: 34)

print(m2ToPyoung)

func changeCtoF(type: String, value: Double) -> String {
    
    var result: Double = 0
    
    if type == "F" {
        result = value * 1.8 + 32
    }else if type == "C" {
        result = (value - 32) / 1.8
    }else{
        return "type입력값 오류 입니다. 타입 입력에 C or F를 입력하여 주십시오"
    }
    
    return "전환 결과 \(result) \(type)로 확인되었습니다."
    
}


var checkTheTemp = changeCtoF(type: "F", value: 350)
print(checkTheTemp)


func dataValueChange(type: String, value: Double) -> String {
    
    var result: Double = 0
    
    if type == "MB" || type == "GB" {
        result = value / 1024
    }else{
        return "type입력값 오류 입니다. 타입 입력에 MB or GB를 입력하여 주십시오"
    }
    
    return "전환 결과 \(result) \(type)로 확인되었습니다."
    
}

var changeData = dataValueChange(type: "GB", value: 2034)
print(changeData)


// 5. 시간(hhmmss)을 받으면 초단위로 변경 초단위를 시간으로 변경
// 110320 >> 4400초

func hourToSeconds(type: String, value: Int) -> String {
    
    var result: Double = 0
    
    
    if type == "second" {
        
    let hour = value / 10000
    let minute = (value - (hour*10000)) / 100
    let second = (value - (hour*10000) - (minute*100))
    
    result = Double((hour*60*60) + (minute*60) + second)
        
    return "전환 결과 \(result) 초로 확인되었습니다."
        
    }else if type == "hour" {
        
        let hour = value / 3600
        let minute = value % 3600 / 60
        let second = value % 3600 % 60

        
    return "전환 결과 \(hour)시간 \(minute)분 \(second)초로 확인되었습니다."
        
    }else{
        return "에러"
    }

    
    
}

print(hourToSeconds(type: "hour", value: 4400))


//입력수 짝수일경우 2로 나눔, 홀수 일경우 3을 곱하고 1일 더함

func Collatz(num: Int) -> Int {
    
    var conutValue: Int = 0
    var resultValue: Int = num
    
    if conutValue < 500 {
    while 1 != resultValue {

        if conutValue < 500 {
            if resultValue%2 == 0 {
                resultValue = resultValue / 2
            
        
            }else if resultValue%2 == 1 {
                resultValue = resultValue * 3 + 1
            }
        
            conutValue += 1
        
        }else{
            return -1
        }
        }
    }
    
    
    
    
    return conutValue
    
}

var x2 = Collatz(num: 450)
print(x2)


// 양의 정수 x가 하샤드 수이려면, x자리수의 합으로 x가 나누어 져야 함.
// 예를 들어, 18의 자리수의 합은 9이고, 18은 9에 나누어 떨어지므로 하샤드 수임
// 매개 변수 n이 하샤드 함수인지 판별하라

func harshad(num: Int) -> Bool {
    
    var tempnum = num
    var divideValue: Int = 0
    
    while 0 < tempnum {
        var temp1 = 0
        temp1 = tempnum % 10
        tempnum = tempnum / 10
        divideValue = divideValue + temp1
        
    }
    print(divideValue)
    print(num)
    
    if num % divideValue == 0 {
        return true
        
    }else{
        
        return false
    }
}

print(harshad(num: 13))



