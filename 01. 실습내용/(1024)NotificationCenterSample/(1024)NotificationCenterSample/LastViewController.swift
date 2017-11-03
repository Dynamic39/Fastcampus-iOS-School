//
//  LastViewController.swift
//  (1024)NotificationCenterSample
//
//  Created by Samuel K on 2017. 10. 24..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func notiPostBtn(_ sender: Any) {
        
        //포스트 기능 추가
        NotificationCenter.default.post(name: Notification.Name.init("TestNoti"), object: inputText.text, userInfo: ["noti":"info"])
        
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
