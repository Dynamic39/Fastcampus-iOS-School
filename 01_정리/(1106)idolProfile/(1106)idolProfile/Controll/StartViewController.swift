//
//  StartViewController.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(withIdentifier: "nextView") as? UINavigationController
        self.present(tableVC!, animated: true, completion: nil)
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(withIdentifier: "nextView") as? UINavigationController
        self.present(tableVC!, animated: true, completion: nil)
        
        
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
