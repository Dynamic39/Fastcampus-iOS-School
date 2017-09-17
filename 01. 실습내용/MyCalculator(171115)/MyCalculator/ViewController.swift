//
//  ViewController.swift
//  MyCalculator
//
//  Created by Samuel K on 2017. 9. 11..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleLB: UIView!
    
    @IBOutlet var displayLabel:UILabel!
    
    

    
    override func viewDidLoad() {
        
        
        displayLabel.text = "0"

        
        print(resultVal)
        
        
        
    }
    
    //총 결과값이 반환
    var resultVal: Int = 0
    //사칙 연산 2회 이상 사용시, 결과값이 임시 저장됨
    var temp1: Int = 0
    
    var isPlus: Bool = false
    var isMinus: Bool = false
    var isMutiple: Bool = false
    var isDivide: Bool = false
    var isON: Bool = false

    // 사칙연산 버튼 입력 값에 따라 각 해당하는 Bool 값을 변화시킴
    @IBAction func operationBtnClick(_ sender: UIButton) {
        
        let valueInSwitch:String = (sender.titleLabel?.text)!
    
        switch valueInSwitch {
        case "+" :
            temp1 = resultVal + Int(displayLabel.text!)!
            displayLabel.text = ""
            isMinus = true
        case "-" :
            resultVal = Int(displayLabel.text!)!
            displayLabel.text = ""
            isMinus = true
        case "*" :
            resultVal = Int(displayLabel.text!)!
            displayLabel.text = ""
            isMinus = true
        case "/" :
            resultVal = Int(displayLabel.text!)!
            displayLabel.text = ""
            isMinus = true
            
            
        default:
            print("입력값이 잘못되었습니다.")
        }
        
        
//        if sender.titleLabel?.text == "+" {
//            
//            temp1 = resultVal + Int(displayLabel.text!)!
//            displayLabel.text = ""
//            isPlus = true
//            
//        }
//        if sender.titleLabel?.text == "-" {
//            
//            resultVal = Int(displayLabel.text!)!
//            displayLabel.text = ""
//            isMinus = true
//            
//        }
//        if sender.titleLabel?.text == "X" {
//            
//            resultVal = Int(displayLabel.text!)!
//            displayLabel.text = ""
//            isMutiple = true
//            
//        }
//        if sender.titleLabel?.text == "/" {
//            
//            resultVal = Int(displayLabel.text!)!
//            displayLabel.text = ""
//            isDivide = true
//            
//        }
        
        
        
    }
    
    // UI로부터 숫자입력을 받아오는 기능 추가
    @IBAction func numberKeyClick(btn:UIButton)
    {

            if displayLabel.text! == "0" {
                
                displayLabel.text! = btn.titleLabel!.text!
            }else if isON {
                displayLabel.text! = btn.titleLabel!.text!
                isON = false
            }else{
                displayLabel.text! += btn.titleLabel!.text!
        }
        
    }
    
    
    // 두번째 값이 입력되었을때, 각 연산자의 Bool값에 따라 사칙연산 실시(1회, 아직 다중 실행 안됨)
    @IBAction func resultPrint(_ sender: UIButton) {
        
        if isPlus == true {
            
            temp1 = temp1 + Int(displayLabel.text!)!
            isPlus = false

        }else if isMinus == true {
            
            temp1 = resultVal - Int(displayLabel.text!)!
            isMinus = false

        }else if isMutiple == true {
            
            temp1 = resultVal * Int(displayLabel.text!)!
            isMutiple = false

        }else if isDivide == true {
            
            if displayLabel.text! == "0" {
                displayLabel.text = "연산 오류"
                
                isDivide = false

            }else{
                temp1 = resultVal / Int(displayLabel.text!)!
                
                isDivide = false

            }
            
        }
        
        isON = true
        displayLabel.text! = String(resultVal)
        
    }
    

    
    
    
    // "C" 를 터치 했을때, 레이블 값 초기화
    @IBAction func deleteNum(btn:UIButton)
    {
        displayLabel.text = "0"
        temp1 = 0
    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
