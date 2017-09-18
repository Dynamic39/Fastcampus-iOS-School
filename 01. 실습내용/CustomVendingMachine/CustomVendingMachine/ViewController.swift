//
//  ViewController.swift
//  CustomVendingMachine
//
//  Created by Samuel K on 2017. 9. 15..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var myAccoutBalance: UILabel!
    @IBOutlet weak var buySuccess: UILabel!
    
    var bankBalance: Int = 0
    var inputMoney: Int = 0



    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myAccoutBalance.text = String(bankBalance)
        


        
        
        
    }

    //차종입력시 금액 생성 버튼
    @IBAction func bmw3btn(_ sender: Any) {
        productPrice.text = "4000"
    }
    
    
    @IBAction func bmw5btn(_ sender: Any) {
        productPrice.text = "6000"
    }
    
    @IBAction func bmw7btn(_ sender: Any) {
        productPrice.text = "13000"
    }
    
    @IBAction func bmwi8btn(_ sender: Any) {
        productPrice.text = "25000"
    }
    
    
    // 금액 입력 버튼
    @IBAction func plus10man(_ sender: Any) {
        bankBalance += 10
        myAccoutBalance.text = String(bankBalance)
    }
    
    @IBAction func plus100man(_ sender: Any) {
        bankBalance += 100
        myAccoutBalance.text = String(bankBalance)
    }
    
    
    @IBAction func plus1000man(_ sender: Any) {
        bankBalance += 1000
        myAccoutBalance.text = String(bankBalance)
    }
    
    
    @IBAction func plus5000man(_ sender: Any) {
        bankBalance += 5000
        myAccoutBalance.text = String(bankBalance)
    }
    
    @IBAction func takeLoan(_ sender: Any) {
        bankBalance += 30000
        myAccoutBalance.text = String(bankBalance)
    }
    
    //차량 구입시 실행되는 기능
    @IBAction func buy(_ sender: Any) {
        
        if productPrice.text! == "" || productPrice.text! == "제품을 선택하여 주십시오!" {
            productPrice.text! = "제품을 선택하여 주십시오!"
        }else if Int(productPrice.text!)! < Int(myAccoutBalance.text!)! {
            var temp1: Int = 0
            temp1 = Int(myAccoutBalance.text!)! - Int(productPrice.text!)!
            
            myAccoutBalance.text = String(temp1)
            
            buySuccess.text = "구입에 성공하셨습니다."
            productPrice.text = ""
        }else{
            buySuccess.text = "통장 잔액이 부족합니다."
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    


}

