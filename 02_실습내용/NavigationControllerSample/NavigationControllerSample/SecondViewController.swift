//
//  SecondViewController.swift
//  NavigationControllerSample
//
//  Created by Samuel K on 2017. 10. 11..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. 백버튼 인스턴스 생성
        
        let back = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        back.text = "<<<"
        back.backgroundColor = .red
        
        let backTitleBtn = UIButton()
        backTitleBtn.setTitle("뒤로", for: .normal)
        backTitleBtn.addTarget(self, action: #selector(self.backHandler(_:)), for: .touchUpInside)
        
        //버튼 및 기타 인스턴스 들을 한번에 표기하기 위해 사용함.
        self.navigationItem.leftBarButtonItems =
        [UIBarButtonItem(customView: back),
        UIBarButtonItem(customView: backTitleBtn)
        ]
        
        let navigationTitle = UINavigationItem()
        navigationTitle.title = "Hi"
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    //해당 뷰 컨트롤러를 팝하는 기능을 가진다.(보여지는 페이지 삭제)
    @objc func backHandler(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
