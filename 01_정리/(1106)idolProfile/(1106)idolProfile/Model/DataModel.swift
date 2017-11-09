//
//  DataModel.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 7..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

/*
 <key>PhoneNumber</key>
 <key>ProfileImage</key>
 <key>MyProfileDescription</key>
 <key>Account</key>
 <key>Password</key>
 <key>BackgroundImage</key>
 <key>StatusDescription</key>
 <key>Nickname</key>
 <key>Email</key>
 */

/*
 구현 내용
 - Plist의 데이터를 불러와서 데이터 모델화 작업 진행
 - 가장 Raw한 데이터부터 순차적으로 Model링 작업을 진행함.
 - Plist의 데이터 저장이 가능한지 확인하고, 가능하다면, Like버튼을 만들어, 각 DetailView Page에 구현할것.
 */

struct IdolPersonalData {
    
    //각 사용할 정보에 대한 변수들을 선언하여 준다.
    var name:String?
    var status:String?
    var mainimage:String?
    var backgroundImage:String?
    var emailAdress:String?

    //변수를 초기화 하여, 데이터 모델을 확인한다.
    init?(data:[String:String] ) {
        
        guard let name = data["Nickname"] else {return nil}
        self.name = name
        guard let status = data["StatusDescription"] else {return nil}
        self.status = status
        guard let mainimage = data["ProfileImage"] else {return nil}
        self.mainimage = mainimage
        guard let backgroundImage = data["BackgroundImage"] else {return nil}
        self.backgroundImage = backgroundImage
        guard let emailAdress = data["Email"] else {return nil}
        self.emailAdress = emailAdress
        
    }
    
}

struct IdolDataModel {
    
    private var IdolData:[IdolPersonalData] = []
    
    var IdolsInfo:[IdolPersonalData] {
        return IdolData
    }
    
    
    init() {
        loadData()
    }
    
    //구조체 안에서 내용이 변경되므로, mutating 을 기재하여 준다.
    mutating func loadData() {
        
        // 번들 파일에서 파일을 가지고 온다.
        if let filePath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"),
        // 번들 파일을 최종 형태에 맞게 변수를 선언하여, 넣어준다.
            let dataArray = NSArray(contentsOfFile: filePath) as? [Any] {
            // for 문을 활용하여, 각 데이터 별로 데이터 로딩을 진행 후, 진행하여 준다.
            for eachProfile in dataArray {
                //for 문이 실행될때 마다 배열 안에 있는 엘리먼트들이 추출된다. 이때, 추출 코드는, 딕셔너리로 진행된다.
                if let realData = eachProfile as? [String:String],
                    //옵셔널 처리를 진행 한 후, 다음 배열에 넣어준다.
                    let profile = IdolPersonalData(data: realData){
                    IdolData.append(profile)
                }
            }
        }
    }
}



