

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    
    for item in list {
        
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

numbers.map { (number: Int) -> Int in
    
    var result = 0
    
    if number % 2 == 0 {
        
        result = 3 * number
    }
    return result
}


let mappedNumbers = numbers.map({number in 3 * number})

print(mappedNumbers)


let sortedNumbers = numbers.sorted { $0 > $1 }

print(sortedNumbers)

