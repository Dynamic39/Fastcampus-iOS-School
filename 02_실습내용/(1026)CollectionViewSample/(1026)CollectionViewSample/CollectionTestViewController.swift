//
//  CollectionTestViewController.swift
//  (1026)CollectionViewSample
//
//  Created by Samuel K on 2017. 10. 26..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class CollectionTestViewController: UIViewController  {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let animals = ["사자", "호랑이", "고양이", "고래", "펭귄", "바다사자", "사막여우", "재규어", "고양이", "고래", "펭귄", "바다사자", "사막여우", "재규어", "고양이", "고래", "펭귄", "바다사자", "사막여우"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CollectionTestViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return animals.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        cell.animalText.text = animals[indexPath.item]
        cell.backgroundColor = .green
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size:CGSize = CGSize(width: collectionView.frame.size.width * 0.5, height: 100)
        
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return collectionView.frame.size.height - 100
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return collectionView.frame.size.width * 0.5
        
    }
    
    

    
    
    //아이템 사이즈를 바꾸지 않고, 가운데에 하나씩만 들어가는 포인트로 진행
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let edgeInset = UIEdgeInsets(top: 0, left: collectionView.frame.size.width * 0.25, bottom: 0, right: collectionView.frame.size.width * 0.25)

        return edgeInset

    }
    
    
}
