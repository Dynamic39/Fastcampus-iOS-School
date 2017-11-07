//
//  ViewController.swift
//  UIScrollViewTest
//
//  Created by Samuel K on 2017. 9. 28..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView:UIScrollView!
    var colorArray:[UIImageView] = []
    
    
    
    
    /*
     
     스크롤을 두줄로 만들기
     view를 두개로 나눌것. ㅎ
     
     
     
     
     */

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
//        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
//        scrollView.contentSize = CGSize(width: 1100, height: scrollView.frame.size.height)
//        view.addSubview(scrollView)
//        scrollView.bounces = false
//        scrollView.isPagingEnabled = true
//
//        
//        for n in 0...10 {
//            
//            let view:UIView = UIView(frame: CGRect(x: n*100, y: 0, width: 100, height: 100))
//            view.backgroundColor = UIColor(red: CGFloat(n)*25/255.0, green: CGFloat(n)*25/255.0, blue: 0, alpha: 1)
//            scrollView.addSubview(view)
//            
//            
//        }
//        
//        
//        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//        scrollView.contentSize = CGSize(width: 1125, height: scrollView.frame.height)
//        view.addSubview(scrollView)
//        scrollView.delegate = self
//        
//        for n in 0...2 {
//            let view:UIImageView = UIImageView(frame: CGRect(x: n*375, y: 0, width: 375, height: 667))
//            scrollView.addSubview(view)
//            view.tag = 0
//            colorArray.append(view)
//        }
//        
//        colorArray[0].backgroundColor = UIColor.blue
//        colorArray[1].backgroundColor = UIColor.green
//        colorArray[2].backgroundColor = UIColor.red
        
        
        let switcher:UISwitch = UISwitch(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        view.addSubview(switcher)
        
        switcher.addTarget(self, action: #selector(valueChangeSwitcher), for: .valueChanged)
        
        
        
    }
    
    
    func valueChangeSwitcher(_ sender:UISwitch){
        if sender.isOn {
            print("스위치 온")
        }else{
            print("스위치 오프")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
        
        
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        
        let offsetx:CGFloat = scrollView.contentOffset.x
        
        
        scrollView.backgroundColor = UIColor(red: offsetx/scrollView.contentSize.width, green: offsetx/scrollView.contentSize.width, blue: offsetx/scrollView.contentSize.width, alpha: 1)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
       // scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

