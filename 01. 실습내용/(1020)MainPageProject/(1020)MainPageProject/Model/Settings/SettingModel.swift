//
//  SettingModel.swift
//  (1022)SettingsTable
//
//  Created by Samuel K on 2017. 10. 23..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


/*
 
struct SettingData {
    var sectionTitle: String
    private var data: [SettingCellData] = []
 
    var datas:[SettingCellData] {
        return data
    }
    
    init?(dataDic: [String: Any]) {
        guard let sectionTitle = dataDic["SectionTitle"] as? String else { return nil }
        self.sectionTitle = sectionTitle
        
        guard let data = dataDic["Data"] as? [Any] else { return nil }
        for index in data {
            if let dataType = index as? [String: String],
                let dataList = SettingCellData(detailData: dataType) {
                self.data.append(dataList)
            }
        }
    }
}

*/



struct SettingTitle {
    
    var specificOptions:[DetailData] = []
    var dividedSection:String
    var rowCounter:Int {
        return specificOptions.count
    }
    
    init?(dataDic: [String:Any]){
        
        guard let sections = dataDic["SectionTitle"] as? String else {return nil}
        dividedSection = sections
        
        guard let data = dataDic["Data"] as? [Any] else {return nil}
        
        for index in data {
            if let dataType = index as? [String:String],
            let dataList = DetailData(dataDic: dataType) {
                specificOptions.append(dataList)
            }
            
        }

        print(specificOptions)
    }
    
}
//버튼 타입 설정
//UI에 버튼 만들고, 스위치 문으로 각각 버튼을 숨김/표시 설정하기(아직 미구현)
enum CellStyle:String {
    case baseType = "SettingBasicCell"
    case detailType = "SettingDetailCell"
    case switchType = "SettingSwitchCell"
    case buttonType = "SettingButtonCell"
}

struct DetailData {
    
    var contentData:String
    var style:CellStyle
    
    init?(dataDic:[String:Any]) {
        
        guard let cellSt = dataDic["CellStyle"] as? String else { return nil }
        style = CellStyle(rawValue: cellSt) ?? .baseType
        
        guard let contents = dataDic["Content"] as? String else {return nil}
        contentData = contents
        
    }
    
    
}


