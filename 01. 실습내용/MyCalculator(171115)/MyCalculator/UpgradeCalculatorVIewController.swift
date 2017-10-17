//
//  UpgradeCalculatorVIewController.swift
//  MyCalculator
//
//  Created by Samuel K on 2017. 9. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class UpgradeCalculatorVIewController: UIViewController {

    @IBOutlet var displayLabel:UILabel!
    
    var firstValue: Int = 0
    var resultValue: Int = 0
    var currentAction: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBAction
    
    @IBAction func operationBtnClick(_ sender: UIButton) {
        
        if let receiveOp = sender.titleLabel?.text {
            
            switch receiveOp {
            case "+":
                resultValue += firstValue
                currentAction = "+"
                firstValue = 0
            case "-":
                resultValue -= firstValue
                currentAction = "-"
                firstValue = 0
                
            case "X":
                resultValue *= firstValue
                currentAction = "X"
                firstValue = 0
            case "/":
                resultValue /= firstValue
                currentAction = "/"
                firstValue = 0
                
            default:
                break
            }
            
        }
    }
    
    
    @IBAction func resultPrint(_ sender: UIButton) {
        
        switch currentAction {
        case "+":
            resultValue += firstValue
            displayLabel.text = String(resultValue)
            firstValue = 0
            
        case "-":
            resultValue -= firstValue
            displayLabel.text = String(resultValue)
            firstValue = 0
            
        case "X":
            resultValue *= firstValue
            displayLabel.text = String(resultValue)
            firstValue = 0
            
        case "/":
            resultValue /= firstValue
            displayLabel.text = String(resultValue)
            firstValue = 0
            
        default:
            break
        }
        
        
    }
    
    
    @IBAction func numberKeyClick(btn:UIButton){
        
        let clicked: Int = btn.tag
        
        if displayLabel.text! == "0" {
            firstValue = clicked
            displayLabel.text! = String(firstValue)
            
        }else{
            firstValue = (firstValue*10)+clicked
            displayLabel.text! = String(firstValue)
            print(firstValue)
        }

    }
    

    
    
    
    
    @IBAction func deleteNum(btn:UIButton)
    {

        displayLabel.text! = "0"
        firstValue = 0
        resultValue = 0
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
    }
    
//    let sum = {(num1, num2) -> Double in num1 + num2}
//    let subtract = {(num1, num2) -> Double in num1 - num2}
//    let multi = {(num1, num2) -> Double in num1 * num2}
//    let divide = {(num1, num2) -> Double in num1 / num2}
    
}
