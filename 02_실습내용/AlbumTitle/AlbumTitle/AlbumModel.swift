//
//  AlbumModel.swift
//  AlbumTitle
//
//  Created by Samuel K on 2017. 10. 17..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation


let album:[String:Any] =
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

//var albumInformaiton:[String:Any]?
//var songInformaiton:[String:Any]?



struct AlbumInfo {
    
    
    var albumTitle:String
    var artist:String
    var genre:String
    
    
    
    init?(dataDic:[String:Any]) {
        
//        guard let albumInformation = dataDic["albumInfo"] as? [String:String] else {return nil}
//        self.albumInformaiton = albumInformation
        
        guard let albumTitle = dataDic["albumTitle"] as? String else {return nil}
        self.albumTitle = albumTitle
        
        guard let artist = dataDic["artist"] as? String else {return nil}
        self.artist = artist
        
        guard let genre = dataDic["genre"] as? String else {return nil}
        self.genre = genre
        
    }
}


struct SongData {
    
//    var songInfomaiton:[String:String]
    /*
     ["songTitle":"웃자 (Be Happy)",
     "trackNum":4,
     "artist":"소녀시대",
     "writer":"이트라이브",
     "playTime":12134,
     "playURL":"http://music.naver.com/126"]
     */
    var songTitle:String
    var trackNum:Int
    var artist:String
    var writer:String
    var playTime:Int
    var playURL:String
    
    init?(dataDic:[String:Any]) {
     
//        guard let songList = dataDic["songList"] as? [String:String] else {return nil}
//        self.songInfomaiton = songList
        
        guard let songTitle = dataDic["songTitle"] as? String else {return nil}
        self.songTitle = songTitle
        print(songTitle)
        
        guard let trackNum = dataDic["trackNum"] as? Int else {return nil}
        self.trackNum = trackNum
        
        guard let artist = dataDic["artist"] as? String else {return nil}
        self.artist = artist
        
        guard let writer = dataDic["writer"] as? String else {return nil}
        self.writer = writer
        
        guard let playTime = dataDic["playTime"] as? Int else {return nil}
        self.playTime = playTime
        
        guard let playURL = dataDic["playURL"] as? String else {return nil}
        self.playURL = playURL
        
        }
    }


//func divideValueFromDic(dataDic:[String:Any]) -> (albumInfo: [String:Any], songInfo: [[String:Any]]) {
//  //var albumTitle  = album["albumInfo"] as? [String:String]
//
//    var albumInformation:[String:Any]?
//    var songInformation:[[String:Any]]?
//
//    if let albumInfo = dataDic["albumInfo"] as? [String:Any] {albumInformation = albumInfo}
//
//
//    if let songInfo = dataDic["songList"] as? [[String:Any]] {songInformation = songInfo}
//
//
//    return (albumInfo: albumInformation!, songInfo: songInformation!)
//
//}

struct AlbumModel {
    
    var albumInfo:AlbumInfo
    var songList:[SongData] = []
    
    
    init?(dataDic:[String:Any]) {
        
        guard let infoDic = dataDic["albumInfo"] as? [String:Any] else {return nil}
        albumInfo = AlbumInfo(dataDic: infoDic)!
        
        guard let list = dataDic["songList"] as? [[String:Any]] else {return nil}
        
        print(list)
        
        for songDic in list
        {
            if let songData = SongData(dataDic: songDic)
            {
                songList.append(songData)
            }
        }
        
    }
    
}


class singletonClass {
    static var sharedInstance:singletonClass = singletonClass()
    
    private init()
    {
        
    }
    
}








