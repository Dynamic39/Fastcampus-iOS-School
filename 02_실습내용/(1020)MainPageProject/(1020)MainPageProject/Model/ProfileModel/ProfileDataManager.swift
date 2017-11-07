//
//  ProfileDataManager.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation




class profileDataManager
{
    
    
    //프로 파일의 모델 데이터를 가져오는 것
    //private설정을 하여, 해당값이 잘못 불리지 않게 진행함.
    private var profiles:[ProfileModel] = []
    
    //연산 프로퍼티를 통해, get만 가능하게 세팅
    var profilesData:[ProfileModel] {
        return profiles
    }
    
    init() {
        loadData()
    }
    
    func loadData()
    {
        //번들에서 데이터 가져와서 프로 파일 만들기
        
        if let filePath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"),
            let dataList = NSArray(contentsOfFile: filePath) as? [Any]
        {
            for data in dataList
            {
                if let realData = data as? [String:String],
                let dataModel = ProfileModel(data: realData)
                {
                    profiles.append(dataModel)
                    print(profiles)
                }
            }
        }
            
    }
    
    
}
