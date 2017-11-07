//
//  ViewController.swift
//  CustomVendingMachine
//
//  Created by Samuel K on 2017. 9. 15..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit


enum makePlusMoney : Int {
    case plus10man = 10
    case plus100man = 100
    case plus1000man = 1000
    case plus5000man = 5000
    case plus30000man = 30000
}



class ViewController: UIViewController {
    
    //타입 이름이 뭔지 붙여줘야함 -> ex: productPriceLB, Label등을 붙임
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
    //버튼을 하나로 합쳐서, 진행 할것
    
    
    @IBAction func selectedCars(_ sender: UIButton) {
    
        if sender.tag == 1 {
            productPrice.text = "4000"
        }else if sender.tag == 2 {
            productPrice.text = "6000"
        }else if sender.tag == 3 {
            productPrice.text = "13000"
        }else if sender.tag == 4 {
            productPrice.text = "25000"
        }
        
    }
    
    

    
    @IBAction func plusMoney(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
        }
    
        
        
        
//        switch makePlusMoney. {
//        case .plus10man:
//            bankBalance += 10
//            myAccoutBalance.text = String(bankBalance)
//        case .plus100man:
//            bankBalance += 100
//            myAccoutBalance.text = String(bankBalance)
//        case .plus1000man:
//            bankBalance += 1000
//            myAccoutBalance.text = String(bankBalance)
//        case .plus5000man:
//            bankBalance += 5000
//            myAccoutBalance.text = String(bankBalance)
//        case .plus30000man:
//            bankBalance += 30000
//            myAccoutBalance.text = String(bankBalance)
//        }
        
        
        
        
    }
    
    
    
    // 금액 입력 버튼
//    @IBAction func plus10man(_ sender: Any) {
//        bankBalance += 10
//        myAccoutBalance.text = String(bankBalance)
//    }
//    
//    @IBAction func plus100man(_ sender: Any) {
//        bankBalance += 100
//        myAccoutBalance.text = String(bankBalance)
//    }
//    
//    
//    @IBAction func plus1000man(_ sender: Any) {
//        bankBalance += 1000
//        myAccoutBalance.text = String(bankBalance)
//    }
//    
//    
//    @IBAction func plus5000man(_ sender: Any) {
//        bankBalance += 5000
//        myAccoutBalance.text = String(bankBalance)
//    }
//    
//    @IBAction func takeLoan(_ sender: Any) {
//        bankBalance += 30000
//        myAccoutBalance.text = String(bankBalance)
//    }
//    
    //차량 구입시 실행되는 기능
    @IBAction func buy(_ sender: Any) {
        
        // 여러 캐스팅이 진행된다면, 변수를 새로 만들어서 변수안에 값을 넣어주는 것이 좋다
        // ex) Int(Exam) -> var nPrice = Int(Exam) 등등 -> 수정할것, pPrice, myBalance 등등으로..
        
        guard let pPrice = productPrice.text else { return }
        guard let myAct = myAccoutBalance.text else { return }
        guard let pPriceChangeInt: Int = Int(pPrice) else { return }
        guard let myActChangeInt: Int = Int(myAct) else { return }
        
        if pPrice == "" || pPrice == "제품을 선택하여 주십시오!" {
            productPrice.text! = "제품을 선택하여 주십시오!"
            // 예외처리 시, Bool 값을 넣어서, 문자열을 비교하는 것이 아닌, 명확하게 에러를 잡을 수 있도록 해줘야함..
            
        }else if pPriceChangeInt < myActChangeInt {
            var temp1: Int = 0
            temp1 = myActChangeInt - pPriceChangeInt
            
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

