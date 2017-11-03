//
//  MainNavi.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 23..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit



class MainNavi: UINavigationController {
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(false, forKey: "isLogin")
        
        NotificationCenter.default.addObserver(forName: Notification.Name.init("LoginAgain"), object: nil, queue: nil) { (noti) in
            self.login()
            
            
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //유저 디폴트 값으로 한번 판별해야 하기 때문에 밖으로 빼준다.
        if !UserDefaults.standard.bool(forKey: "isLogin")
        {
            
            performSegue(withIdentifier: "LoginFlow", sender: nil)
            
            //login()
        }
    }
    
    //로그인이 되었는지 확인하는 싱글턴을 실행
    func login() {
        
        
        performSegue(withIdentifier: "LoginFlow", sender: nil)
//        if let pressVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi"){
//            self.present(pressVC, animated: false, completion: nil)
//         }
        
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
