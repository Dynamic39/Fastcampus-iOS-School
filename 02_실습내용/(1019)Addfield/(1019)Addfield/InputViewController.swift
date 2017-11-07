//
//  InputViewController.swift
//  (1019)Addfield
//
//  Created by Samuel K on 2017. 10. 19..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - SaveMethod
    @IBAction func savedBtn(_ sender: UIBarButtonItem) {
        
        let name = textfield.text ?? ""
        DataCenter.maincenter.addName(name)
        
        self.navigationController?.popViewController(animated: true)
        
        
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
