//
//  ViewController.swift
//  AlbumTitle
//
//  Created by Samuel K on 2017. 10. 17..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

let album2:[String:Any] =
    ["albumInfo":["albumTitle":"2집 Oh!",
                  "artist":"소녀시대",
                  "genre":"댄스"],
     "songList":[["songTitle":"Oh!",
                  "trackNum":1,
                  "artist":"소녀시대",
                  "writer":"김정배",
                  "playTime":12340,
                  "playURL":"http://music.naver.com/123"],
                 ["songTitle":"Show! Show! Show!",
                  "trackNum":2,
                  "artist":"소녀시대",
                  "writer":"김부민",
                  "playTime":10130,
                  "playURL":"http://music.naver.com/124"],
                 ["songTitle":"웃자 (Be Happy)",
                  "trackNum":4,
                  "artist":"소녀시대",
                  "writer":"이트라이브",
                  "playTime":12134,
                  "playURL":"http://music.naver.com/126"]
        ]]
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "UserPlist", ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: path) as? [String:String] {
            print(dic)
            }
        
        
        let testUser:DataCenter = DataCenter()
        testUser.loadUserData()
        print(testUser)
        
        let testUser2:DocumentLoad = DocumentLoad()
        print(testUser.loadUserData())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

