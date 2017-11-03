//
//  DataCenter.swift
//  (1019)Addfield
//
//  Created by Samuel K on 2017. 10. 19..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


class DataCenter {
    
    static var maincenter:DataCenter = DataCenter()
    
    var nameList:[String] = []
    
    
    private init()
    {
        loadNameList()
    }
    
    func loadNameList()
    {
        //plist에 불러와서 nameList에 할당
        //주소 값이 있는지 확인
        let dataPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/DataList.plist"
        print(dataPath)
        
        //주소 값이 없으면 해당 경로에 새로운 파일을 복사해줌
        if !FileManager.default.fileExists(atPath: dataPath) {
            
            if let dataList = Bundle.main.path(forResource: "DataList", ofType: "plist"){
                do{
                    try FileManager.default.copyItem(atPath: dataList, toPath: dataPath)
                }catch{
                    print("Fatal Error, Line36 DataCenter.swift")
                }
            }
            
        }
        
        if let list = NSArray(contentsOfFile: dataPath) as? [String] {
            self.nameList = list
        }
        
    }
    
    func addName(_ name:String)
    {
        self.nameList.append(name)
        saveNameList()
        
    }
    
    
    func saveNameList()
    {
        //nameList에 있는 데이터를 plist에 저장
        
        let dataPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/DataList.plist"
        NSArray(array: nameList).write(toFile: dataPath, atomically: true)
        
    }
    
}
