//
//  ViewController.swift
//  UIViewTest
//
//  Created by Samuel K on 2017. 9. 25..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    var num1Btn:UIButton = UIButton()
    var num2Btn:UIButton = UIButton()
    var num3Btn:UIButton = UIButton()
    var num4Btn:UIButton = UIButton()
    var num5Btn:UIButton = UIButton()
    var num6Btn:UIButton = UIButton()
    var num7Btn:UIButton = UIButton()
    var num8Btn:UIButton = UIButton()
    var num9Btn:UIButton = UIButton()
    
    var onBtn:UIButton = UIButton()
    var offBtn:UIButton = UIButton()
    var currentArray:[UIButton] = []
    
    var tf:UITextField = UITextField()
    var tfLabel:UILabel = UILabel()
    var tfBtn:UIButton = UIButton()
    var temp:String = ""

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         let upperSquare:UIView = UIView()
         upperSquare.backgroundColor = UIColor.blue
         upperSquare.alpha = 0.5
         upperSquare.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
         
         
         self.view.addSubview(upperSquare)
         
         let lowerSquare:UIView = UIView()
         lowerSquare.backgroundColor = UIColor.brown
         lowerSquare.alpha = 0.2
         lowerSquare.frame = CGRect(x: 15, y: self.view.frame.size.height-115, width: 345, height: 100)
         
         self.view.addSubview(lowerSquare)
         */
        
        /*
         UIview에 대한 이해
         UIView, UILabel, UIImageView
         Frame 연습 추가
         */
        
        
        onBtn = UIButton(type: .system)
        onBtn.frame = CGRect(x: 10, y: 500, width: 100, height: 100)
        onBtn.backgroundColor = .green
        onBtn.setTitle("ON", for: .normal)
        onBtn.setTitle("ON-선택됨", for: .selected)
        onBtn.addTarget(self, action: #selector(ViewController.onBtnPush), for: .touchUpInside)
        onBtn.isSelected = false
        
        self.view.addSubview(onBtn)
        
        
        offBtn = UIButton(type: .system)
        offBtn.frame = CGRect(x: 111, y: 500, width: 100, height: 100)
        offBtn.backgroundColor = .green
        offBtn.setTitle("OFF", for: .normal)
        offBtn.setTitle("OFF-선택됨", for: .selected)
        offBtn.addTarget(self, action: #selector(ViewController.offBtnPush), for: .touchUpInside)
        
        offBtn.isSelected = false
        
        self.view.addSubview(offBtn)
        
        //버튼 만들기
        
        num1Btn = UIButton(type: .system)
        num1Btn.frame = CGRect(x: 16, y: 28, width: 100, height: 100)
        num1Btn.tag = 1
        
        num2Btn = UIButton(type: .system)
        num2Btn.frame = CGRect(x: 137, y: 28, width: 100, height: 100)
        num2Btn.tag = 2
        
        num3Btn = UIButton(type: .system)
        num3Btn.frame = CGRect(x: 259, y: 28, width: 100, height: 100)
        num3Btn.tag = 3
        
        num4Btn = UIButton(type: .system)
        num4Btn.frame = CGRect(x: 16, y: 136, width: 100, height: 100)
        num4Btn.tag = 4
        
        
        num5Btn = UIButton(type: .system)
        num5Btn.frame = CGRect(x: 137, y: 136, width: 100, height: 100)
        num5Btn.tag = 5
        
        
        num6Btn = UIButton(type: .system)
        num6Btn.frame = CGRect(x: 259, y: 136, width: 100, height: 100)
        num6Btn.tag = 6
        
        
        num7Btn = UIButton(type: .system)
        num7Btn.frame = CGRect(x: 16, y: 244, width: 100, height: 100)
        num7Btn.tag = 7
        
        
        num8Btn = UIButton(type: .system)
        num8Btn.frame = CGRect(x: 137, y: 244, width: 100, height: 100)
        num8Btn.tag = 8
        
        
        num9Btn = UIButton(type: .system)
        num9Btn.frame = CGRect(x: 259, y: 244, width: 100, height: 100)
        num9Btn.tag = 9

        
        var btnArray:[UIButton] = [num1Btn, num2Btn, num3Btn, num4Btn, num5Btn, num6Btn, num7Btn, num8Btn, num9Btn]
        
        for i in 0..<btnArray.count {
            
            self.view.addSubview(btnArray[i])
            btnArray[i].backgroundColor = UIColor.cyan
            
            btnArray[i].isSelected = false
            btnArray[i].setTitle("", for: .normal)
            btnArray[i].setTitle("선택됨", for: .selected)
            btnArray[i].addTarget(self, action: #selector(selectedBtn(_:)), for: .touchUpInside)
            
        }
        
        currentArray = btnArray
    
        tf.frame = CGRect(x: 10, y: 370, width: 200, height: 30)
        tf.borderStyle = .line
        view.addSubview(tf)
        
        tfLabel.frame = CGRect(x: 10, y: 410, width: 300, height: 60)
        tfLabel.backgroundColor = .blue
        tfLabel.alpha = 0.5
        tfLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
        view.addSubview(tfLabel)
        
        tfBtn = UIButton(type: .system)
        tfBtn.frame = CGRect(x: 220, y: 370, width: 30, height: 30)
        tfBtn.setTitle("GO", for: .normal)
        tfBtn.backgroundColor = .red
        tfBtn.alpha = 0.7
        view.addSubview(tfBtn)
        tfBtn.addTarget(self, action: #selector(textViewInput), for: .touchUpInside)
        
    

    }
    
    func textViewInput(){
        
        temp += tf.text! + "\n"
        
        tfLabel.text = temp
        tf.text = ""
        
        print(tfLabel.text!)
        
    }
    
    func selectedBtn(_ sender:UIButton){
        
        let index:Int = sender.tag
        
        if onBtn.isSelected {
            
            if currentArray[index-1].isSelected {
                currentArray[index-1].isSelected = false
            }else{
                currentArray[index-1].isSelected = true
            }
        } else if offBtn.isSelected {
            
            if sender.tag % 2 != 0 {
            for i in 0..<currentArray.count {
                
                if i % 2 == 0 && currentArray[i].isSelected == false {
                    currentArray[i].isSelected = true
                }else{
                    currentArray[i].isSelected = false
                }
                }
            } else if sender.tag % 2 == 0 {
                for i in 0..<currentArray.count {
                    if i % 2 != 0 && currentArray[i].isSelected == false {
                        currentArray[i].isSelected = true
                    }else{
                        currentArray[i].isSelected = false
                    }
                }
            }
            
            }
        }
    
    



    
    func onBtnPush(){
        
        onBtn.isSelected = true
        onBtn.isUserInteractionEnabled = false
        
        offBtn.isSelected = false
        offBtn.isUserInteractionEnabled = true
        
    }
    
    func offBtnPush(){
        
        offBtn.isSelected = true
        offBtn.isUserInteractionEnabled = false
        
        onBtn.isSelected = false
        onBtn.isUserInteractionEnabled = true
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

