//
//  User.swift
//  PsyTest
//
//  Created by Samuel K on 2017. 10. 18..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


struct User {
    
    let username:String
    var email:String
    var password:String
    
    init?(dic: [String:Any]) {
        
        guard let username = dic["username"] as? String else { return nil }
        
        guard let email = dic["email"] as? String else { return nil }
        
        guard let password = dic["password"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.password = password
        
    }

}


struct Users {
    var users:[User]
    
    init?(dic: [String:Any]) {
        
        self.users = []
        
        guard let userArray = dic["Item"] as? [[String:Any]] else { return nil }
        
        //유저를 만드는 작업을 함, 배열로 되어 있는 부분을 한번에 처리하는 구문을 시행한다.
        for user in userArray {
            
            
            //self.users.append(User(dic: user)!)
            self.users.append(User(dic: user)!)
            
            
        }
     
        print(users)
    }
    
    
}
