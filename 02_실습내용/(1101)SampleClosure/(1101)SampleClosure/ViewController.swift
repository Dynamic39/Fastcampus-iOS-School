//
//  ViewController.swift
//  (1101)SampleClosure
//
//  Created by Samuel K on 2017. 11. 1..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var customView: CustomView!
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.didTapClosure = {(string: String) -> Void in
            self.label.text = string
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

