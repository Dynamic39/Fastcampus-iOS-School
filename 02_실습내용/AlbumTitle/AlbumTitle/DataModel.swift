//
//  DataModel.swift
//  AlbumTitle
//
//  Created by Samuel K on 2017. 10. 19..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


enum Gender:Int
{
    case man = 1
    case woman = 2
}

//유저 모델
struct UserModel
{
    var userID:String
    var pw:String
    var email:String
    var birthday:String?
    var gender:Gender?
    
    //연산 프로퍼티 사용하여, 진행
    var dictionary:[String:Any]
    {
        
        var returnDic = ["UserID":self.userID, "userPW":self.pw]
        
        if let birth = birthday {
            returnDic.updateValue(birth, forKey: "birthday")
        }
        
        let genderValue = self.gender?.rawValue ?? 0
        
        return returnDic
    }
    
    init?(dataDic:[String:Any])
    {
        //필수 항목 모델화
        guard let userID = dataDic["UserID"] as? String else {return nil}
        self.userID = userID
        
        guard let pw = dataDic["userPw"] as? String else {return nil}
        self.pw = pw
        
        guard let email = dataDic["email"] as? String else {return nil}
        self.email = email
        
        //옵셔널 항목 모델화
        self.birthday = dataDic["birthDay"] as? String
        
        if let rawData = dataDic["gender"] as? Int, (rawData == 1 || rawData == 2)
        {
            self.gender = Gender(rawValue:rawData)
        }
    }
    
    //모델링 된 아이템의 데이터를 다시 모델화 시키는 작업을 함.

    
}


