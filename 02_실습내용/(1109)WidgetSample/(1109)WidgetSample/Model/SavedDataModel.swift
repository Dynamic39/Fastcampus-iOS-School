//
//  SavedDataModel.swift
//  (1109)WidgetSample
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

class inputData {
    
    
    var SaveData = [[:]]
}


struct originData {
    
    
    var titleLB:String
    
    init?(data: [String:String]) {
        
        guard let titleLB = data["title"] else {return nil}
        self.titleLB = titleLB
        
    }

}

struct SavedData {
    
    var SavedData:[originData]
    
}
