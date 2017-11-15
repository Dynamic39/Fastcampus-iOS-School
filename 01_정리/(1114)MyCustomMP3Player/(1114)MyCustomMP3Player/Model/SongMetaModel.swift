//
//  SongMetaModel.swift
//  (1114)MyCustomMP3Player
//
//  Created by Samuel K on 2017. 11. 14..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


/*
 MP3의 메타 정보를 가져와서, 모델링해서 쓸수 있는 데이터로 만들것
 
 1. 기본적으로 MP3 Meta의 속성은 Data이다.
 2. 파일안에 있는 메타정보를 추출하고, 딕셔너리로 만들기 위해선, 우선 한개파일의 모델링 작업이 필요하다.
 3. 각각의 정보는 String으로 인스턴스를 받을 수 있으나, ArtImage의 경우, Data를 그대로 받아오기 때문에, UIImage속성을 잘 선택하여 준다.
 4. 각각의 데이터를 뽑아내는 Struct를 구성하면, 그다음에 전체 리스트를 조회 할 수 있는 DataModel를 구축한다.
 */


struct SongMetaInformation {
    
    //메타 정보를 인스턴스로 만들 변수를 선언한다.
    //필요한 내용은, 노래제목, 가수이름, 커버 이미지등이 필요하다.
    
    //음악 데이터를 가져올 변수
    var songURL:String
    
    var title = "NONAME"
    var artistName:String?
    
    private var artworkData:Data?
    var lyrics:String?
    
    var coverImage:UIImage?{
        if let data = self.artworkData {
            return UIImage(data: data)
        }else{
            return nil
        }
    }
    init?(fileName:String) {
        
        self.songURL = fileName
        
        guard let filePath = Bundle.main.url(forResource: songURL, withExtension: "mp3") else {return}
        let asset = AVAsset(url: filePath)
        let metaData:[AVMetadataItem] = asset.metadata
        self.lyrics = asset.lyrics
        //for 문을 실행하여, metaData의 값을 가져와서 각 항목에 배치하여 준다.
        for item in metaData {
            //RawData를 가져오기 때문에 키값에 대한 선언이 필요하다.
            if let key = item.commonKey?.rawValue {
                
                //각각의 키값에 해당하는 값을 넣어준다.
                switch  key {
                case "title" :
                    if let title = item.value as? String {
                        self.title = title
                    }
                case "artist":
                    self.artistName = item.value as? String
                case "artwork":
                    self.artworkData = item.dataValue
                default:
                    print("에러?")
                }
            }
        }
    }
}
