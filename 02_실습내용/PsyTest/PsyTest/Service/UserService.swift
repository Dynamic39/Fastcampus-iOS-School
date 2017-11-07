//
//  UserService.swift
//  PsyTest
//
//  Created by Samuel K on 2017. 10. 18..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


//싱글톤 어플리케이션 실습
struct UserService {
    
    var model: Users?
    
    //연산 프로퍼티
    var documentDirectory: URL {
     return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    //타입 프로퍼티를 호출함.
    static var sharedInstance: UserService = UserService()
    
    
    init() {
        // plist에서 정보를 받아와서, model에 넣어줌.
        
        loadData()
    }
    
    mutating func loadData() {
        
        //파일 매니저 내에 Plist정보 확인(경로, 파일 유무 등, 최초에는 생성되지 않음)
        //let datURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        
        let datURL = documentDirectory.appendingPathComponent("UserData.plist")
        
        //파일 매니저의 경로를 포함하는 상수를 지정하여 준다.
        let dataStringPath = datURL.path
        print("dataStringPath: \(dataStringPath)")
        
        //최초 파일 매니저에 파일이 없을 경우(!) 번들에 있는 자료를 활용하여, 시행한다.
        if !FileManager.default.fileExists(atPath: dataStringPath) {
            
            //새로 생성한 파일의 주소를 지정한다.
            guard let plistURL = Bundle.main.url(forResource: "Userdata", withExtension: "plist") else { return }
            
            //새롭게 생성한 파일을 기존 path 파일에 복사를 한다.
           try! FileManager.default.copyItem(at: plistURL, to: datURL)
            
        }
        
//        let propertyDecoder = PropertyListDecoder()
//        let data = try! Data(contentsOf: <#T##URL#>)
//        propertyDecoder.decode(Users.self, from: <#T##Data#>)
        
        //새롭게 카피된 아이템을 NSDictionnary를 통하여, 호출한다.
        //plist 의 데이터의 타입을 설정하여 준다.
        let dataDictionary = NSDictionary(contentsOf: datURL) as? [String:Any]
        
        //User의 data안에 해당 구조를 집어넣는다.
        self.model = Users(dic: dataDictionary!)
        
    }
    
    func validateUserInfo(username: String, password:String) -> Bool {
        
        if let model = self.model {
            
            for user in model.users {
                if user.username == username && user.password == password {
                    return true
                }
            }
        }
        return false
        
    }
}





