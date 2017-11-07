//
//  MainNavi.swift
//  MainPageProject
//
//  Created by youngmin joo on 2017. 10. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainNavi: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: "isLogined")
        {
//            showLoginPage()
            performSegue(withIdentifier: "GoToLoginSegue", sender: nil)
        }
    }
    
    
    func showLoginPage()
    {
        
        let nextStoryboard = UIStoryboard(name: "LoginFlowStoryboard", bundle: nil)
        if let presentVC = nextStoryboard.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController
        {
            self.present(presentVC, animated: false, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
