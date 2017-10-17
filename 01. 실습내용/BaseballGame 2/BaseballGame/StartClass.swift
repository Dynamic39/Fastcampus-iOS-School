//
//  StartClass.swift
//  BaseballGame
//
//  Created by Samuel K on 2017. 9. 25..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


class Start {
    
    var isRunning = true

    
    func makeRandomNum() -> [Int] {
        
        var randomAnswer:[Int] = []
        
        while randomAnswer.count < 3 {
            let ranNum = Int(arc4random_uniform(10))
            
            if !randomAnswer.contains(ranNum) {
                randomAnswer.append(ranNum)
            }
            
        }
        
        return randomAnswer
        
    }
    
}
