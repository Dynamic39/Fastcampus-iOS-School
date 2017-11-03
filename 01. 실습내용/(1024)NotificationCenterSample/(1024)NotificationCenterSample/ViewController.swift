//
//  ViewController.swift
//  (1024)NotificationCenterSample
//
//  Created by Samuel K on 2017. 10. 24..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //옵져버 기능 추가
        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil)
        { (noti) in
            
            if let text = noti.object as? String
            {
                self.displayLB.text = text
            }
            
            
            print(noti.object)
            print(noti.userInfo)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

