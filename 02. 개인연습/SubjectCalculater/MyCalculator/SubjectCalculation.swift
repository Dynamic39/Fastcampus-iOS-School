//
//  SubjectCalculation.swift
//  MyCalculator
//
//  Created by Samuel K on 2017. 9. 12..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

class SubjectCalculation {
    
    func calculation(student:Student) {
        
        let totalScore:Int = sumAllsubject(subjects: student.subjects)
        let totalAverage:Int = totalScore / student.subjects.count
        
        
        student.totalGradePoint = Double(totalAverage)
        student.totalScore = totalScore
        
    }
    
    
    
    func sumAllsubject(subjects:[Subject]) -> Int {
        
        var totalScore: Int = 0
        
        for s in subjects {
            totalScore += s.score
            
        }
        
        return totalScore
    }

    
    
    
}
