//
//  ViewController.swift
//  NavigationControllerSample
//
//  Created by Samuel K on 2017. 10. 11..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. 네비게이션 컨트롤러에 버튼 생성
        let nextBtn = UIButton()
        nextBtn.setTitleColor(UIColor.blue, for: .normal)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.addTarget(self, action: #selector(self.nextBtnHandler(_:)), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Hello!"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //버튼 핸들러
    @objc func nextBtnHandler(_ sender:UIButton) {
        goToNextVc()
        
    }
    //다음 넥스트뷰로 가는 기능을 추가한다. 필요할때마다 쓰기 위해, 별도로 메서드로 구현하였음
    private func goToNextVc() {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //네비게이션 컨트롤러 푸시 요청
    func pushAction() {
        
        let nextVC = UIViewController()
        
        //네비게이션 컨트롤러에 push요청함.
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    //네비게이션 컨트롤러 pop요청(삭제)
    func popAction() {
        self.navigationController?.popViewController(animated: true)
    }


}

