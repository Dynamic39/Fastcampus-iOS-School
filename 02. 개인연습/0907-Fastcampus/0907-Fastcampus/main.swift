//
//
//var list:[Int] = []
//
//var count = list.count
//print("list의 엘리먼트 갯수 : \(count)")
//list.append(3)
//list.append(contentsOf: [1, 2])
//count = list.count
//
//print("list의 엘리먼트 갯수 : \(count)")
//
//print(list[0])
//
//list.insert(4, at: 0)
//print(list[0])
//
//list.remove(at: 0)
//print(list[0])
//
//var setInt: Set<Int> = []
//
//var oddDigits: Set<Int> = [1, 3, 5, 7, 9]
//let evenDigits: Set<Int> = [2, 4, 6, 8]
//let primeDigits: Set<Int> = [2, 3, 5, 7]
//
//oddDigits.intersection(evenDigits)
//oddDigits.symmetricDifference(primeDigits)
//
//
//print(oddDigits)
//
//var dictionaryValue :[String:String] = ["ICN": "인천공항", "HND": "하네다공항", "NRT": "나리타 공항"]
//
//print(dictionaryValue)
//print(dictionaryValue["ICN"]!)
//
//
//


// 요일 구하기
// 특정 조건이 완성되면 딕셔너리를 수정하는 함수를 선언

func getWeekDay(atMonth: Int, day: Int) -> String {
    
    let currentDay: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    let currentMonth: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var sumDays: Int = day
    
    for i in 0..<atMonth {
        
        sumDays = sumDays + currentMonth[i]
        
    }
    
    let temp = (sumDays + ( currentDay.count - 3 ) ) % currentDay.count
    
    return currentDay[temp]
    
}


var date: String = getWeekDay(atMonth: 4, day: 1)
print(date)


/*
 
 중복숫자 없애기
 함수입력 shoter(num:1002233422)
 리턴결과 : 102342
 
 */




//func shorter(num: [Int]) -> [Int] {
//    var result: [Int] = []
//    result.append(num[0])
//    print(num[0])
//    
//    for i in 1..<num.count {
//        if num[i] != num[i-1] {
//            
//            result.append(num[i])
//        print("\(num[i])")// \(num[i-1])")
//        }
//    }
//    
//    
//    return result
//}
//
//
//print( shorter(num: [1,1,0,0,2,2,3,3,4,2]))
//[1,0,2,3,4,2]


//소수 변환, 2, 3, 5, 7

//func allPrimeNumber(endNum: Int) -> Int {
//    
//    var Primenumber = 0
//    
//    if endNum % 2 == 0 {
//        
//        Primenumber = 2
//        
//    }else if endNum % 3 == 0 {
//        
//        Primenumber = 2
//        
//    }else if endNum % 5 == 0 {
//        
//        Primenumber = 5
//        
//    }else if endNum % 7 == 0 {
//        
//        Primenumber = 7
//        
//    }else {
//        return -1
//    }
// 
//    return Primenumber
//}
//
//
//var primeNum = allPrimeNumber(endNum: 50)
//print(primeNum)

//func allPrimeNumber(endNum: Int) -> [Int] {
//
//    var primenumber: [Int] = []
//    
//    for i in 2...endNum {
//        primenumber.append(i)
//    }
//    
//    var result: [Int] = []
//    
//    var i: Int = 0
//    while i < primenumber.count {
//        var j: Int = i+1
//        result.append(primenumber[i])
//        
//        while j < primenumber.count {
//          
//            if primenumber[j] % primenumber[i] == 0 {
//                primenumber.remove(at: j)
//            }
//            j = j + 1
//
//        }
//        i += 1
//    }
//    
//    return result
//    
//}
//
//var primeNum = allPrimeNumber(endNum: 50)
//print(primeNum)
//
//
//let list:[String] = ["0", "1", "2", "3", "4","5", "6","7", "8","9", "10"]
//
//func test2(num: Int) -> [String] {
//    var subList :[String] = []
//    
//    for numStr in list {
//        
//        let number:Int = Int(numStr)!
//        
//        if num < number {
//            
//            subList.append(numStr)
//        }
//        
//        
//        
//        
//    }
//
//
//    return subList
//}

// 앞 중복 숫자 없애기


let duplicatedList: [Int] = [1, 2, 3, 3, 4, 4, 6, 6]

func RemoveDupli(num :[Int]) -> [Int]{
    
    var resultValue :[Int] = []
    
    resultValue.append(num[0])
    
    for i in 1..<num.count {
        
        if num[i] != num[i-1] {
            
            resultValue.append(num[i])
        }
        
    }
    
    return resultValue
    
}


print(RemoveDupli(num: duplicatedList))










//func test() -> Int {
//    
//    var totalNum :Int = 0
//    
//    for numStr in list {
//        
//        let num:Int = Int(numStr)!
//        totalNum = totalNum + num
//        
//        
//    }
//    
//    return totalNum
//}
//
//var listPrint = test()
//print(listPrint)



//func shorter2(num:Int) -> Int
//{
//    var num = num
//    var shortNumList: [Int] = []
//    
//    while  0 < lastnum {
//        <#code#>
//    }
//}
//}


// 시저 암호 구하기
// 함수입력 : ceaser(data:["a", "b", "c", "d"], keyNum: 4)
// 결과 : ["e", "F", "G", "h")
// 배열 밀기, 키숫자에 맞게 밀어줘야함

/*
 - 알파벳 숫자 나열
 - 키 순서대로 알파벳 재 배열
 - 알파벳 나열에서 특정값 위치 검색
 
 */


func ceaser(data :[String], keyNum :Int) -> [String]{
    
    var alphabet :[String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    var push = 0
    
    if keyNum > 26 {
        push = keyNum % 26
    }else{
        push = keyNum
    }
    
    var resultValue :[String] = []
    
    


    for j in 0..<data.count {
        
        let temp = alphabet.index(of: data[j])!
        if temp+push > 26 {
            push = push - 25
            resultValue.append(alphabet[j+push])
        }else if temp+push == 26{
            resultValue.append(alphabet[0])
        }else{
                resultValue.append(alphabet[j+push])
            }
        

        
    }

    return resultValue
}

print(ceaser(data: ["a", "b", "c", "d"], keyNum: 30))

print(101%26)


















