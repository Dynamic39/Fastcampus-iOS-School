//
//  DataCenter.swift
//  AlbumTitle
//
//  Created by Samuel K on 2017. 10. 19..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


class DataCenter {
    
    static var main:DataCenter = DataCenter()
    
    func loadUserData()
    {
        
        //파일이 없는 경우 새로 생성
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
        
        print(docPath)
        
        if !FileManager.default.fileExists(atPath: docPath)
        {
            //1-1. 복사
            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist"){
                do{
                    
                   try! FileManager.default.copyItem(atPath: bundlePath, toPath: docPath)
                    
                }
                catch
                {
                    print("복사 실패")
                }
        }
            //2-2. 만들기
        
    }
        //만들어진 데이터에 새로운 값들을 입력
        if let dic = NSDictionary(contentsOfFile: docPath) as? [String:Any] {
            
            var dictionary = dic
            
            dictionary.updateValue("sana", forKey: "user_id")
            dictionary.updateValue("123", forKey: "pw")
            dictionary.updateValue("2017.10.18", forKey: "birthday" )
            
            let nsDic = NSDictionary(dictionary: dictionary)
            nsDic.write(toFile: docPath, atomically: true)
            
        }
     print(docPath)
        
    }
    
    
    
    func write(userdata data:UserModel)
    {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
    }
}


class DocumentLoad {
    
    // 다큐먼트에 문서가 있는지 확인함.(싱글턴 패턴으로 작성)
    static var main:DocumentLoad = DocumentLoad()
    
    func loadUserData() {
        //1. 파일이 있는지 경로 확인
        // 주소 확인 시행 NSDICTIONARY
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
        print(docPath)
        //2. 파일이 없는 경우 새로 생성
        
        if !FileManager.default.fileExists(atPath: docPath) {
            
            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: docPath)
                } catch {
                    print("Fatal Error Line 85, DataCenter.swift")
                }
            }
            
        }
        //3. 만들어진 값들의 세부 사항 변경
        
        if let dic = NSDictionary(contentsOfFile: docPath) as? [String:Any] {
            var dictionary = dic
            
            dictionary.updateValue("Sammy", forKey: "test1")
            dictionary.updateValue("101010", forKey: "test2")
            
            
            
        }
        
        print("All data is updated, Line98, DataCenter.swift")
        
    }
    
    
    
}
