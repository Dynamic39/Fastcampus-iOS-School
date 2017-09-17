//
//  ViewController.swift
//  MyCalculator
//
//  Created by Samuel K on 2017. 9. 11..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var displayLabel:UILabel!
    
    override func viewDidLoad() {
        
        

        
        
        super.viewDidLoad()
        
        let cal = SubjectCalculation()
        
        let math = Subject(name: "수학")
        math.setScore(score: 100)
        
        let english = Subject(name: "영어")
        english.setScore(score: 60)
        
        
        let s1 = Student(name: "강삼규", id: 3004)
        
        s1.addSubject(subject: math)
        s1.addSubject(subject: english)

        
        // s1.setSubjects(subjects: [math, english])
        
        cal.calculation(student: s1)
        print(s1.totalGradePoint)
        print(s1.totalScore)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
