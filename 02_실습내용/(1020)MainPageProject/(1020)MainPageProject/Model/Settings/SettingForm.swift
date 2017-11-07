//
//  SettingForm.swift
//  (1022)SettingsTable
//
//  Created by Samuel K on 2017. 10. 23..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

class SettingManager {
    
    private var settingMenu:[SettingTitle] = []

    var setInfor:[SettingTitle] {
        return settingMenu
    }


    
    init() {
        loadDataTitle()
        print(settingMenu)
    }
    
    
    
    func loadDataTitle() {
        
       if let filePath = Bundle.main.path(forResource: "Settings", ofType: "plist") {
        if let dataList = NSArray(contentsOfFile: filePath) as? [Any] {
         
            for data in dataList {
                
                if let realData = data as? [String:Any] {
                    if let dataModel = SettingTitle(dataDic: realData) {
                        settingMenu.append(dataModel)

                        //print(settingMenu)
                }
                }
            }
        }
        }
        
    }
    
//    func loadDataList(){
//
//        if let filePath = Bundle.main.path(forResource: "Settings", ofType: "plist") {
//            if let dataList = NSDictionary(contentsOfFile: filePath) as? [String:Any] {
//
//                for data in dataList {
//
//                    if let realData = data as? [[String]] {
//                        if let dataModel = SettingTitle(dataDic: realData)?.specificOptions{
//                            settingOption.append(dataModel)
//
//                            //print(settingMenu)
//                        }
//                    }
//                }
//            }
//        }
//
//    }
//
    
    
    
    
}


