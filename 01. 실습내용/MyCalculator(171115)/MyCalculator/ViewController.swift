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
    var temp2: Int = 0 // 2회 계산을 위한 임시 저장소, 완성 후, 이름 변경
    var temp3: Int = 0
    
    var stackVal: [Int] = [0]
    var calculVal: [String] = []

    
    var calAction1: String = ""
    var calAction2: String = ""
    
    var isON: Bool = false

    // 사칙연산 버튼 입력 값에 따라 각 해당하는 Bool 값을 변화시킴
    
    @IBAction func operationBtnClick(_ sender: UIButton) {
        
        //연산자에 didset, willset 을 사용하여 진행할 것
        
        


//        let valueInSwitch:String = (sender.titleLabel?.text)!
//        
//
//        switch valueInSwitch {
//        case "+" :
//
//            temp1 = Int(displayLabel.text!)!
//            
//            if temp2 == 0 || calAction1 != "+" {
//                temp2 = temp1
//                calAction1 = "+"
//            }else if temp2 != 0 && calAction1 == "+" {
//                temp2 = temp2 + temp1
        
//                calAction2 = "+"
//                calAction1 = ""
//            }
//            
//            displayLabel.text = ""
//
//
//        case "-" :
//            temp1 = Int(displayLabel.text!)!
//            
//            if temp2 == 0 || calAction1 != "-" {
//                temp2 = temp1
//                calAction1 = "-"
//                
//            }else if temp2 != 0 && calAction1 == "-" {
//                temp2 = temp2 - temp1
//                calAction2 = "-"
//                calAction1 = ""
//            }
//            
//            displayLabel.text = ""
//
//        case "X" :
//            temp1 = Int(displayLabel.text!)!
//            
//            if temp2 == 0 {
//                temp2 = temp1
//            }else if temp2 != 0 && calAction1 == "*" {
//                temp2 = temp2 * temp1
//                calAction2 = "*"
//            }
//            
//            displayLabel.text = ""
//            calAction1 = "*"
//
//        case "/" :
//            temp1 = Int(displayLabel.text!)!
//            
//            if temp2 == 0 {
//                temp2 = temp1
//            }else if temp2 != 0 && calAction1 == "/" {
//                temp2 = temp2 / temp1
//                calAction2 = "/"
//            }
//            
//            displayLabel.text = ""
//            calAction1 = "/"
//
//            
//        default:
//            print("입력값이 잘못되었습니다.")
//        }
//        
    
    }
    
    // UI로부터 숫자입력을 받아오는 기능 추가
    @IBAction func numberKeyClick(btn:UIButton)
    {
        


            if displayLabel.text! == "0" {
                
                displayLabel.text! = btn.titleLabel!.text!
            }else if isON {
                displayLabel.text! = btn.titleLabel!.text!
                resultVal = 0
                isON = false
            }else{
                displayLabel.text! += btn.titleLabel!.text!
        }
        
    }
    
    
   // 두번째 값이 입력되었을때, 각 연산자의 Bool값에 따라 사칙연산 실시(1회, 아직 다중 실행 안됨)
    @IBAction func resultPrint(_ sender: UIButton) {
        
        temp3 = Int(displayLabel.text!)!
        
        if calAction1 == "+" || calAction2 == "+" {
            
            resultVal = temp2 + Int(displayLabel.text!)!
            print(temp1)
            print(temp2)

        }else if  calAction1 == "-" || calAction2 == "-"  {
            
            resultVal = temp2 - Int(displayLabel.text!)!
            
        }else if  calAction1 == "*" || calAction2 == "*"  {
            
            resultVal = temp2 * Int(displayLabel.text!)!
            
        }else if calAction1 == "*" || calAction2 == "*" {
            
            if displayLabel.text! == "0" {
                displayLabel.text = "연산 오류"

            }else{
                resultVal = temp2 / Int(displayLabel.text!)!

            }
            
            
            
        }
        
        displayLabel.text! = String(resultVal)
        calAction1 = ""
        calAction2 = ""
        temp1 = 0
        temp2 = 0
        temp3 = 0
        isON = true

        
    }
    

    
    
    
    // "C" 를 터치 했을때, 레이블 값 초기화
    @IBAction func deleteNum(btn:UIButton)
    {
        displayLabel.text = "0"
        calAction1 = ""
        calAction2 = ""
        isON = false

    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
