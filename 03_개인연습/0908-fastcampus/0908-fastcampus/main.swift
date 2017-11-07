

// 두개의 값을 파라메터로 받아 두 값을 더하여 print()를 찍는 함수

func intReturn(first :Int, second :Int){
    
    let result = first + second
    print(result)

}

intReturn(first: 4, second: 6)

func strReturn(first :String, second :String){
    
    let result :String = first + second

    
    print(result)
    
}

strReturn(first: "패스트 ", second: "캠퍼스")



func doubleRt(first :Double, second :Double){
    
    let result :Double = first + second
    
    print(result)
}

doubleRt(first: 3.44, second: 44.44)


// 두개의 값을 파라메터로 더한 값을 반환하는 함수 만들기

func releaseInt(first :Int, second :Int) -> Int {
    
    let result = first + second
    
    return result
    
}


print(releaseInt(first: 5, second: 6))

func releaseStr(first :String, second :String) -> String {
    
    let result = first + second
    
    return result
    
}


print(releaseStr(first: "야호", second: "!!"))


func releaseDou(first :Double, second :Double) -> Double {
    
    let result = first + second
    
    return result
    
}


print(releaseDou(first: 32.1321, second: 312.31))


//두개의 값을 받아 큰수를 반환하는 함수 만들기

func biggercounter(num1 :Int, num2 :Int) -> Int {
    
    var resultNum :Int = 0
    
    if num1 > num2 {
        
        resultNum = num1
        
    }else{
        resultNum = num2
    }
    
    return resultNum
    
}

var compareValues = biggercounter(num1: 45, num2: 45)
print(compareValues)

// 한개의 값을 받아 양수인지 음수인지 판별하여 Bool 값 리턴

func checkValue(value :Int) -> Bool {
    
    if value > 0 {
        return true
    }else{
        return false
    }
}

var plusCheck = checkValue(value: 4)
print(plusCheck)




