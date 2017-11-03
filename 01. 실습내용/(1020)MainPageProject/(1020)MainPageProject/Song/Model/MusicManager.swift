//
//  MusicManager.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


class MusicDataManager{
    
    
    var songDatas:[SongDataModel] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        
        for i in 0...29 {
            
            if let model = SongDataModel(fileName: "\(i)") {
                songDatas.append(model)
            }
        }
    }
}
