//
//  SongViewController.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 26..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var artistLB: UILabel!
    
    var mp3player:AVAudioPlayer?
    var currentIndex:String?
    

    lazy var dataManager:MusicDataManager = MusicDataManager()
    
    
    // 복습 진행 할것.
    
//    var currentIndex = 0 {
//        willSet{
//            let selectedData = dataManager.songDatas[newValue]
//            self.titleLB.text = selectedData.title
//            self.artistLB.text = selectedData.artistName
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnAlbumCover(_:)))
        collectionView.addGestureRecognizer(gesture)
        
        // 복습 진행 할것.
        
        //collectionView.isPagingEnabled = true
        
//        let selectedData = dataManager.songDatas[currentIndex]
//        self.titleLB.text = selectedData.title
//        self.artistLB.text = selectedData.artistName
//
//
    }
    
    @objc func tapOnAlbumCover(_ sender:UITapGestureRecognizer) {
        // 앨범커버 선택시 가사 뷰 띄우기
        
        let frameSize:CGRect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        let lyricsView = UIView(frame: frameSize)
        lyricsView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        self.view.addSubview(lyricsView)
        
        let lyricsText:UITextView = UITextView(frame: frameSize)
        lyricsText.text = dataManager.songDatas[Int(currentIndex!)!].lyric
        lyricsText.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        lyricsView.addSubview(lyricsText)
        lyricsText.textColor = UIColor.white
        
        lyricsText.textAlignment = .center
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        
        let visibleItems: NSArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentItem:IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem:IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        
        if nextItem.row < dataManager.songDatas.count {
            collectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    
    @IBAction func playBtn(_ sender: Any) {
        
        playSound()

    }
    
    
    @IBAction func forward(_ sender: Any) {
        
//        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
//        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
//        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
//        // This part here
//        if nextItem.row < dataManager.songDatas.count {
//            self.collectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
//
//        }
        
        //셀이 보이는 아이템을 지정함
        
        let visibleItems: NSArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentItem:IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem:IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        
        if nextItem.row < dataManager.songDatas.count {
            collectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
        }
        
        
    }
    
    func playSound(){
        
        // 해당 뷰로 이동시, 번들 파일이 선택되어야 함
        if let fileName = currentIndex
        {
            print(fileName)
            guard let url = Bundle.main.url(forResource: "Song/"+fileName, withExtension: "mp3") else {return}
            do {
                //                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                //                try AVAudioSession.sharedInstance().setActive(true)
                
                mp3player = try AVAudioPlayer(contentsOf: url)
                
                guard let mp3player = mp3player else {return}
                mp3player.prepareToPlay()
                mp3player.play()
                
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
    


}


extension SongViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    /*
     
     다음것 다시한번 맞춰서 할것.
     
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.songDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CoverCell

       cell.coverImage.image = dataManager.songDatas[indexPath.item].artworkImg
        titleLB.text = dataManager.songDatas[indexPath.item].title
        artistLB.text = dataManager.songDatas[indexPath.item].artistName
        
        currentIndex = dataManager.songDatas[indexPath.item].songURL
        print("현재 노래 번호: ", currentIndex)
        
        
        return cell
    }
    
    //셀의 크기를 설정하는 메서드, sizeForItem으로 검색할것.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.bounds.size.height, height: collectionView.bounds.size.height)
    }
    
    
    //컬렉션 view의 인셋을 설정하는 부분
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        //사이드 인셋을 정함.
       let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.height)/2
//        let sideInset = collectionView.bounds.size.width/2
//        let sideInset = collectionView.bounds.size.height/2
//        let sideInset = collectionView.bounds.size.width
//        let sideInset = collectionView.bounds.size.height
//        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.height)
        print(sideInset)
        
        return UIEdgeInsets(top: 0, left:sideInset, bottom: 0, right: sideInset)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.height)
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.height)
        return sideInset
    }
    
    
    
    
    
    
}
