//
//  ViewController.swift
//  (1023)NotificationSample
//
//  Created by Samuel K on 2017. 10. 23..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum NumberCheckType:Error
    {
        
        case negativeNum
        case biggerNum
        case nonNum
        case noData
        
    }
    
    func isSmallNum(baseNum:Int, targetNum:Int?) throws -> Int
    {
        guard let compareNum = targetNum else {
            throw NumberCheckType.noData
        }
        
        if baseNum < 0 || compareNum < 0
        {
            throw NumberCheckType.negativeNum
        }
        
        if baseNum < compareNum
        {
            throw NumberCheckType.biggerNum
        }
        
        
        return compareNum
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data:Int?
        
        do {
            try isSmallNum(baseNum: 5, targetNum: data)
        } catch NumberCheckType.noData {
            print("target값을 확인하시오(nil입니다.)")
        } catch NumberCheckType.biggerNum {
            print("target값은 base값보다 클 수 없습니다.")
        } catch NumberCheckType.negativeNum {
            print("target값이 음수입니다.")
        } catch {
            print("FATAL ERROR")
        }
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

