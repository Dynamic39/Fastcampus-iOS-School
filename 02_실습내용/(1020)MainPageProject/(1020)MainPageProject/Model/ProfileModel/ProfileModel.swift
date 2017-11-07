//
//  DataCenter.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation
/*
<dict>
<key>PhoneNumber</key>
<string>010-1234-5678</string>
<key>ProfileImage</key>
<string>ProfileImage1</string>
<key>MyProfileDescription</key>
<string>프로듀스 101의 피지컬 甲 진중함과 코믹함, 카리스마와 귀여움이 공존하는 프리스틴의 리더 그리고 영원히 기억될 I.O.I의 리더</string>
<key>Account</key>
<string>user1</string>
<key>Password</key>
<string>user1</string>
<key>BackgroundImage</key>
<string>BackImage1</string>
<key>StatusDescription</key>
<string>다이어트중</string>
<key>Nickname</key>
<string>강미나</string>
<key>Email</key>
<string>mnkang123@fastcampus.co.kr</string>
<key>LikeCount</key>
<string></string>
</dict>
*/

struct ProfileModel {
    

    var nickname:String
    var statusDescription:String
    var profileImage:String
    
    var email:String
    var phoneNumber:String
    var myProfileDesc:String

    var backgroundImage:String
    
    init?(data: [String:String])
    {
        guard let nickName = data["Nickname"] else {return nil}
        self.nickname = nickName
        
        guard let phoneNum = data["PhoneNumber"] else {return nil}
        self.phoneNumber = phoneNum
        guard let proImage = data["ProfileImage"] else {return nil}
        self.profileImage = proImage
        guard let proDesc = data["MyProfileDescription"] else {return nil}
        self.myProfileDesc = proDesc
        guard let bgImgName = data["BackgroundImage"] else {return nil}
        self.backgroundImage = bgImgName
        guard let statusDesc = data["StatusDescription"] else {return nil}
        self.statusDescription = statusDesc
        guard let email = data["Email"] else {return nil}
        self.email = email
        
        
    }
    
    
}
