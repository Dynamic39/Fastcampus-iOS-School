//
//  UserModel.swift
//  loginController
//
//  Created by Samuel K on 2017. 9. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


final class UserModel {
    
    var model:[User] = [
        User.init(userName: "FC1", password: "1234"),
        User.init(userName: "FC2", password: "4321"),
        User.init(userName: "sky4411v", password: "rkd12345")
    ]
    
    struct User {
        
        var userName: String
        var password: String
    }
    
    
    func findUser(username: String, password: String) -> Bool {
        
        for user in model {
            
            if user.userName == username && user.password == password {
                return true
            }
        }
        return false
    }
    
    func addUser(name:String, password:String) {
        
        let newUser = User(userName: name, password: password)
        model.append(newUser)
        
    }
    
}









