//
//  File.swift
//  (1025)GenericSample
//
//  Created by Samuel K on 2017. 10. 25..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

//제네릭으로 스트럭트 형성
struct Stack<j> {
    
    private var stackTemp:[j] = []
    
    mutating func push(_ data: j){
        
        stackTemp.append(data)
        
    }
    
    mutating func pop() -> j {
        
        return stackTemp.removeLast()
        
    }
    
    
    
}


//제네릭으로 큐를 만들기
//제일 먼저 들어간게 나중에 나오는

struct Queue<T> {
    
    private var queueTemp:[T] = []
    
    mutating func enqueue(_ data: T)
    {
        queueTemp.append(data)
    }
    
    mutating func dequeue(_ data: T)
    {
        queueTemp.removeFirst()
    }
    
}


