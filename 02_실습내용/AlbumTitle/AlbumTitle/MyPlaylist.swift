//
//  MyPlaylist.swift
//  AlbumTitle
//
//  Created by Samuel K on 2017. 10. 17..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation

/*
    - playlists: array of playlist
    - id: 3
    - upid: nil
    - title: “나의 노래”
    - main_img_url: “http://naver.com”
    - thumb_img_url: “http://naver.com”
    - song_cnt: 3
    - is_premium: “N”
    - monthly_ym: 201705
 
 
    - like_info: 좋아요 정보
    - song: object key for song.
        - id: 321
    - like_cnt
    - is_like: “N”
    - up: object key for user playlist.
        - id: nil
    - like_cnt : nil
    - is_like: “N”
    - artist: object key for artist.
        - id: 103
    - like_cnt : 1022
    - is_like: “Y”
*/


struct Playlist {
    
    var id:String
    var upid:String
    var title:String
    var mainImgURL:String
    var thumbImgURL:String
    var songcount:Int
    var isPremium:Bool
    var monthlyYm:String

    
    init?(dataDic: [String:Any]) {
        
        guard let id = dataDic["id"] as? String else {return nil}
        self.id = id
        
        guard let upid = dataDic["upid"] as? String else {return nil}
        self.upid = upid
        
        guard let title = dataDic["title"] as? String else {return nil}
        self.title = title
        
        guard let mainImgURL = dataDic["mainImgURL"] as? String else {return nil}
        self.mainImgURL = mainImgURL
        
        guard let thumbImgURL = dataDic["thumbImgURL"] as? String else {return nil}
        self.thumbImgURL = thumbImgURL
        
        guard let songcount = dataDic["songcount"] as? Int else {return nil}
        self.songcount = songcount
        
        guard let isPremium = dataDic["isPremium"] as? Bool else {return nil}
        self.isPremium = isPremium
        
        guard let monthlyYm = dataDic["monthlyYm"] as? String else {return nil}
        self.monthlyYm = monthlyYm
        
        
    }
}

struct likeInfomation {

    var song:Bool
    var likeCount:Int
    var isLike:Bool
    
    init?(dataDic: [String:Any]) {
        
        guard let song = dataDic["song"] as? Bool else {return nil}
        self.song = song
        
        guard let likeCount = dataDic["likeCount"] as? Int else {return nil}
        self.likeCount = likeCount
        
        guard let isLike = dataDic["isLike"] as? Bool else {return nil}
        self.isLike = isLike
    }

}

