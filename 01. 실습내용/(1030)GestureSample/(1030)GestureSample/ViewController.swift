//
//  ViewController.swift
//  (1030)GestureSample
//
//  Created by Samuel K on 2017. 10. 30..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var TapCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        let xPoint = Int(touch.location(in: touch.view).x)
        let yPoint = Int(touch.location(in: touch.view).y)
        
        print("xposition", xPoint)
        print("yposition", yPoint)
        
        Location.text = "X좌표 : \(xPoint), Y좌표 : \(yPoint)"
        TapCount.text = "\(touch.tapCount)"
        
        print("touch TapCount", touch.tapCount)
        
        return true
        
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

