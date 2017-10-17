//
//  LoginDataModel.swift
//  loginController
//
//  Created by Samuel K on 2017. 10. 16..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


/*
 
 let userDic:Dictionary<String,Any>
 = ["userID":"joo",
 “userPW":"12345!@",
 "email":"knightjym@gmail.com",
 ]
 
 */

//// 성별 판별기를 열거형으로 처리하여, 진행, 1번의 경우, 로우 데이터, case 앞의 문은 타입임
//enum gender:Int {
//    case man = 1
//    case woman = 2
//}
//
//// 로그인 데이터 구조 설정
//struct LoginModel {
//
//    // 필수 데이터 설정, 하기 세개 아이템의 경우, 필수로 구성되어야 하기 때문에 옵셔널로 설정하면 안된다.
//    var userID:String
//    var userPW:String
//    var userMail:String
//
//    // 로그인 데이터 중, 선택사항의 경우, 옵셔널로 처리한다.
//    var userBithday:String?
//    var userGender:gender?
//
//    init?(dataDic:[String:Any]){
//
//        guard let userID = dataDic["userID"] as? String else {return nil}
//        self.userID = userID
//
//        guard let userPW = dataDic["userPW"] as? String else {return nil}
//        self.userPW = userPW
//
//        guard let userMail = dataDic["userMail"] as? String else {return nil}
//        self.userMail = userMail
//
//        self.userBithday = dataDic["userBirthDay"] as? String
//
//        if let rawData = dataDic["gender"] as? Int{
//            if rawData == 1 || rawData == 2{
//                self.userGender = gender(rawValue: rawData)
//            }
//        }
//    }
//}
//var displayData:[[String:String]]?



var ticketDummy:[[String:String]] = [["url":"naver.com", "ticketTitle":"wolf!", "startDate":"20171010","endDate":"20181010"],["url":"daum.com", "ticketTitle":"병아리!", "startDate":"20171011","endDate":"20181014"]]


struct TicketLink {
    
    // 필수데이터 설정
    
    var url:String
    var ticketTitle:String
    var displaySpot:String
    var startDate:String
    var endDate:String
    
    //해당 변수는 특정 클래스에서 생성된 변수의 번호를 가져와서 진행한다.
    //현재는 더미 파일로 0을 입력하여 진행한다.
    var takenum = 0
    
    
    // 모델은 딕셔너리

    init?(dataArray:[[String:String]]) {
        
            var tempDic:[String:String] = dataArray[takenum]
            
            guard let url = tempDic["url"] else {return nil}
            self.url = url
            
            guard let ticketTitle = tempDic["ticketTitle"] else {return nil}
            self.ticketTitle = ticketTitle
            
            guard let displaySpot = tempDic["displaySpot"] else {return nil}
            self.displaySpot = displaySpot
            
            guard let startDate = tempDic["startDate"] else {return nil}
            self.startDate = startDate
            
            guard let endDate = tempDic["endDate"] else {return nil}
            self.endDate = endDate
            

    }
    
}

    
    

