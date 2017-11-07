//
//  SecondViewController.swift
//  (1024)NotificationCenterSample
//
//  Created by Samuel K on 2017. 10. 24..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var displayLB2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil)
        { (noti) in
            print(noti.object)
            print(noti.userInfo)
            
            if let text = noti.object as? String
            {
                self.displayLB2.text = text
            }
            
            
        }
        
        
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
