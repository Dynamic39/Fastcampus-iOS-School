

// 정사각형 (Square) 둘레, 넓이


func square(type: String, length: Int) -> Int {
    
    // type에 따른 분류를 진행한다
    
    var returnValue: Int = 0
    
    if type == "A" {
        
        returnValue = length * length
        
    }else if type == "P" {
        
        returnValue = length * 4
        
    }else{
        
        print("값이 잘못되었습니다.")
        return -1
        
    }
    
    return returnValue
    
}


var areasquare = square(type: "A", length: 4)
print(areasquare)

// 직사각형 (Rectangle) 둘레, 넓이

func rectangle(type: String, length: Int, width: Int) -> Int {
    
    
    var returnValue: Int = 0
    
    if type == "A" {
        returnValue = length * width
    }else if type == "P" {
        returnValue = length * 2 + width * 2
    }else{
        print("값이 잘못되었습니다")
        return -1
    }
    
    return returnValue
    
    
}

var rectangleAType = rectangle(type: "A", length: 4, width: 5)
var rectanglePType = rectangle(type: "P", length: 4, width: 5)

print(rectangleAType)
print(rectanglePType)



//원, 원통, 구의 원주율, 부피, 둘레 등

func allRound(type: String, radius: Double, height: Double) -> Double {
    
    let pi: Double = 3.14
    var returnValue: Double = 0
    
    if type == "A" {
        returnValue = (pi * radius) * (pi * radius)
    }else if type == "C" {
        returnValue = 2 * pi * radius
    }else if type == "V-Cylinder" {
        returnValue = pi * radius * radius * height
    }else if type == "V-Sphere" {
        returnValue = 4 * pi * (radius*radius*radius) / 3
    } else {
        print("값이 잘못되었습니다")
        return -1
    }
    
    return returnValue
    
}

var roundAtype = allRound(type: "A", radius: 5, height: 0)
print(roundAtype)

var roundCtype = allRound(type: "C", radius: 5, height: 0)
print(roundCtype)

var roundVCylindertype = allRound(type: "V-Cylinder", radius: 5, height: 7)
print(roundVCylindertype)

var roundVSpheretype = allRound(type: "V-Sphere", radius: 5, height: 7)
print(roundVSpheretype)


// 삼각형

func triangle(type: String, base: Double, height: Double) -> Double {
    
    var returnValue: Double = 0
    
    if type == "A" {
        
        returnValue = (base * height) / 2
        
    } else {
        print("값이 잘못되었습니다")
        return -1
    }
    
    return returnValue
    
}

var triangleAtype = triangle(type: "A", base: 5, height: 9)
print(triangleAtype)


func trapezoid(type: String, base: Int, alpha: Int, height: Int) -> Int {
    
    var returnValue: Int = 0
    
    if type == "A" {
        
        returnValue = height * ( alpha + base ) / 2
        
    } else {
        
        print("값이 잘못되었습니다")
        return -1
    }
    
    return returnValue
    
}


var trapezoidAType = trapezoid(type: "A", base: 5, alpha: 4, height: 3)
print(triangleAtype)


func cube(type: String, length: Int) -> Int {
    
    var returnValue = 0
    
    if type == "A" {

        returnValue = length * length * length
        
    } else {
        
        print("값이 잘못되었습니다")
        return -1
    }
    
    return returnValue
}

var cubeAType = cube(type: "A", length: 3)
print(cubeAType)

func rectangularSolid(type: String, length: Int, height: Int) -> Int {
    
    var returnValue = 0
    
    if type == "A" {
        
        returnValue = length * height
        
    } else {
        
        print("값이 잘못되었습니다")
        return -1
    }
    
    return returnValue
}

var rectangularSolidAType = rectangularSolid(type: "A", length: 4, height: 3)
print(rectangularSolidAType)

func cone(type: String, radius: Double, height: Double) -> Double {
    
    var returnValue :Double = 0
    let pi :Double = 3.14
    
    if type == "A" {
        
        returnValue = pi * radius * radius * height / 3
        
    } else {
        
        print("값이 잘못되었습니다")
        return -1
        
    }
    
    return returnValue
    
}

var coneAtype = cone(type: "A", radius: 4, height: 5)
print(coneAtype)


