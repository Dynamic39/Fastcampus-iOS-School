//
//  ViewController.swift
//  (1027)CollectionView
//
//  Created by Samuel K on 2017. 10. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var scrollView: UICollectionView!
    
    var SampleArray:[String] = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ","1", "2", "3", "4", "5", "6", "7", "8"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.allowsSelection = true
        scrollView.allowsMultipleSelection = true
        
        //색변경
        
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return SampleArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = scrollView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as? TestCell
        cell?.textLB.text = SampleArray[indexPath.item]
        cell?.backgroundColor = .green
        cell?.layer.borderWidth = 0.5
        
        
        
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
        return 5
        
    }
    
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        
        
        //리로드, 즉 다시 불러오는 것음.
        //scrollView.reloadData()
        
        //업데이트
        scrollView.performBatchUpdates({
            
            //무조건 데이터 추가해야함.
            
            let indexPath = IndexPath(item: SampleArray.count, section: 0)
            SampleArray.append("H")
            scrollView.insertItems(at: [indexPath])
            
        }, completion: nil)
        
        
    }
    
    
    @IBAction func deleteBtn(_ sender: Any) {
        
        
        //업데이트
        
        if SampleArray.count > 0 {
         
            if let indexPaths = scrollView.indexPathsForSelectedItems
            {
                let sortedIndexPath = indexPaths.sorted(by: { (path1, path2) -> Bool in
                    return path1.item > path2.item
                })
                scrollView.performBatchUpdates({
                    
                    for index in indexPaths
                    {
                        SampleArray.remove(at: index.item)
                    }
                    
                    scrollView.deleteItems(at: indexPaths)
                }, completion: nil)
            }
        } else {
            
            let alertControll = UIAlertController(title: "더이상 지울수 없습니다", message: "데이터를 추가해주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertControll.addAction(action)
            present(alertControll, animated: true, completion: nil)
            
        }
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//
//
//            return true
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelected", indexPath.item)
        
        //선택된 셀의 정보를 가져온다
        let cell = scrollView.cellForItem(at: indexPath)
        cell?.isSelected = true

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("deSelected", indexPath.item)
        
        let cell = scrollView.cellForItem(at: indexPath)
        cell?.isSelected = false
        

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

