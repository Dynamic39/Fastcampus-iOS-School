//
//  subject.swift
//  MyCalculator
//
//  Created by Samuel K on 2017. 9. 12..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


class Subject {
    
    private var name: String = ""
    var score: Int = 0
    var credit: Int = 1
    var grade: String = "F"
    var gradePoint: Double = 0.0
    
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        print("초기화")
    }
    
    func setScore(score:Int){
        self.score = score

}
    
    

    func changeGrade() {
        if score > 0 && score  <= 100 {
            if score >= 95 {
                grade = "A+"
            }else if score > 90 {
                grade = "A"
            }else if score > 85 {
                grade = "B+"
            }else if score > 80 {
                grade = "B"
            }else if score > 75 {
                grade = "C+"
            }else if score > 70 {
                grade = "C"
            }
        }
        
    }
    
    
    
    
    
}














