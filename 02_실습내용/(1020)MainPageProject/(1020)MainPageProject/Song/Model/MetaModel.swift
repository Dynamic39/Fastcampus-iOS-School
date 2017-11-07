//
//  MetaInfo.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 26..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit


//노래 디렉토리를 설정함

let songDirectory = "Song/"

//노래의 모델링 작업을 진행함 (1차)

struct SongDataModel {
    
    //반드시 있어야함
    var songURL:String
    
    //메타 정보에 없을 수도 있음
    var title:String = "이름 없음"
    var artistName:String?
    var artworkData:Data?
    
    var lyric:String?
    
    // 하단 다시한번 확인 내가 한거 아님!!!
    
    var artworkImg:UIImage? {
        if let data = self.artworkData {
            return UIImage(data: data)
        }
        return nil
    }
    
    init?(fileName:String) {
        
        self.songURL = fileName
        
        guard let url = Bundle.main.url(forResource: songDirectory+fileName, withExtension: "mp3") else {return nil}
        
        let asset = AVURLAsset(url: url)
        let metaData:[AVMetadataItem] = asset.metadata
        
        self.lyric = asset.lyrics
        
        for item in metaData {
            
            if let key = item.commonKey?.rawValue
            {
                switch key {
                    
                case "title":
                    if let title = item.value as? String {
                        self.title = title
                    }
                case "artist":
                    self.artistName = item.value as? String
                case "artwork":
                    self.artworkData  = item.dataValue
                default :
                    print("")
            
                }
            }
        }
    }
}
    
    
    
    
    
    
    
    
    
    


    
