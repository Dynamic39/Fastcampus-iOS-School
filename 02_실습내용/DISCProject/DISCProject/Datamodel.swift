//
//  DISCmodel.swift
//  DISCProject
//
//  Created by Samuel K on 2017. 11. 2..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

//데이터 모델을 작성 할때, 데이터를 어떻게 가져올지 결정한다.
//한번 데이터를 로드할때 마다, 네개가 한번에 표시되어야 하므로, 


struct Datamodel {
    
    var exampleList:[[String:String]] = []

    
    init() {
        
        loadData()
        
    }
    
    
    mutating func loadData(){
        
        if let data = Bundle.main.path(forResource: "exampleList", ofType: "plist"),
        let realData = NSArray(contentsOfFile: data) as? [[String:String]]
        {
            exampleList = realData
            print(exampleList)
        }

    }
}




struct ResultDataModel {

    var title:String?
    var msg:String?

    init?(data: [String:String]) {
        
       guard let title = data["title"] else {return nil}
        self.title = title
        
       guard let msg = data["msg"] else {return nil}
        self.msg = msg
        
    }
}

struct ResultDataType {
    
    var d:ResultDataModel?
    var i:ResultDataModel?
    var s:ResultDataModel?
    var c:ResultDataModel?

    
    init?(data: [String:Any]) {
        
        guard let dda = data["d"] as? [String:String] else {return nil}
        self.d = ResultDataModel(data: dda)
        guard let ida = data["i"] as? [String:String] else {return nil}
        self.i = ResultDataModel(data: ida)
        guard let sda = data["s"] as? [String:String] else {return nil}
        self.s = ResultDataModel(data: sda)
        guard let cda = data["c"] as? [String:String] else {return nil}
        self.c = ResultDataModel(data: cda)
        
    }
    
    
}

class ResultDataModels {
    
    var resutModels:ResultDataType?
    
    
    init() {
        
        loadData()
        
    }
    
    func loadData(){
        if let filepath = Bundle.main.path(forResource: "resultList", ofType: "plist") {
            if let dataList = NSDictionary(contentsOfFile: filepath) as? [String:Any] {
                
                resutModels = ResultDataType(data: dataList)
            }
        }
    }
}


