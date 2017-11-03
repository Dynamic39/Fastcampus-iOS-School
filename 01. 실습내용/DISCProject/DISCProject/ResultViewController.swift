//
//  ResultViewController.swift
//  DISCProject
//
//  Created by Samuel K on 2017. 11. 2..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var typeText: UILabel!
    @IBOutlet var resultText: UITextView!
    
    var test:String?
    var test2:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeText.text = test
        resultText.text = test2
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
