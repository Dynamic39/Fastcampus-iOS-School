//
//  ViewController.swift
//  BaseballGame
//
//  Created by Samuel K on 2017. 9. 21..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var resultView: UILabel!
    
    @IBOutlet weak var currentValueLB1: UILabel!
    @IBOutlet weak var currentValueLB2: UILabel!
    @IBOutlet weak var currentValueLB3: UILabel!
    
    @IBOutlet weak var historyView: UITextView!
    
    //게임 시작을 알리는 불 값
    var isRunning:Bool = false
    
    //숫자 배열에 넣기전 데이터를 임시적으로 저장해두는 공간
    var counterNum1: Int?
    var counterNum2: Int?
    var counterNum3: Int?
    
    //랜덤 배열이 들어가는 공간
    var answerArray:[Int] = []
    private var secretNumberList: [Int] = []
    
    //라벨에 있는 데이터가 입력되는 배열
    var tempArray: [Int] = []
    var textViewArray: [String] = []
    
    //베이스볼 스트라이크/볼 판별 카운터
    var strikeCounter: Int = 0
    var ballCounter: Int = 0
    var textViewStr: String = ""
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func inputbtn(_ sender: UIButton) {
    
        //세개의 레이블에 순차적으로 데이터 입력
        
        if !tempArray.contains(sender.tag) && isRunning {
            if counterNum1 == nil {
                currentValueLB1.text = String(sender.tag)
                counterNum1 = sender.tag
                tempArray.append(counterNum1!)
                
            }else if counterNum2 == nil{
                currentValueLB2.text = String(sender.tag)
                counterNum2 = sender.tag
                tempArray.append(counterNum2!)
                
            }else if counterNum3 == nil{
                currentValueLB3.text = String(sender.tag)
                counterNum3 = sender.tag
                tempArray.append(counterNum3!)
                
            }
            
        }
        
        print(tempArray)
        
    }
    
    @IBAction func checkBtn(_ sender: UIButton) {
        
//        // 입력 번호 별도 array에 입력
//        if counterNum1 != nil && counterNum2 != nil && counterNum3 != nil {
//            print(tempArray)
//        }else{
//            resultView.text = "세자리 모두 입력"
//        }
//        
        // 기준번호 판별기
        // 과제 : for 문 사용해서 하기 (~주말까지)
        
        if counterNum1 == nil {
            resultView.text = "세자리 모두 입력"
            
        }else if tempArray[0] == answerArray [0] {
            strikeCounter += 1
        }else if tempArray [0] == answerArray [1] || tempArray [0] == answerArray[2]{
            ballCounter += 1
        }
        
        if counterNum2 == nil {
            resultView.text = "세자리 모두 입력"
        }else if tempArray[1] == answerArray [1] {
            strikeCounter += 1
        }else if tempArray [1] == answerArray [0] || tempArray [1] == answerArray[2]{
            ballCounter += 1
        }
        
        
        
        if counterNum3 == nil {
            resultView.text = "세자리 모두 입력"
        }else if tempArray[2] == answerArray [2] {
            strikeCounter += 1
        }else if tempArray [2] == answerArray [0] || tempArray [2] == answerArray[1]{
            ballCounter += 1
        }
        
        
        if counterNum1 != nil && counterNum2 != nil && counterNum3 != nil{
            
            textViewStr += "\(strikeCounter)S, \(ballCounter)B Num : \(counterNum1!)\(counterNum2!)\(counterNum3!) \n"
            resultView.text = "\(strikeCounter)S, \(ballCounter)B"
            
        }
        
        
        
        if strikeCounter == 3 {
            resultView.text = "성공"
            isRunning = false
        }
        
        historyView.text = textViewStr
        
        tempArray.removeAll()
        
        counterNum1 = nil
        counterNum2 = nil
        counterNum3 = nil
        
        strikeCounter = 0
        ballCounter = 0
        
        currentValueLB1.text = ""
        currentValueLB2.text = ""
        currentValueLB3.text = ""
        
        print(tempArray)
        
    }
    
    //시작 버튼 구현
    
    @IBAction func startBtn(_ sender: UIButton) {
        answerArray = makeRandomNumber()
        isRunning = true
        resultView.text = ""
        
    }
    
    
    //삭제 버튼 구현
    @IBAction func deleteBtn(_ sender: UIButton) {
        
        if counterNum3 != nil {
            counterNum3 = nil
            
            currentValueLB3.text = nil
        }else if counterNum2 != nil {
            counterNum2 = nil
            
            currentValueLB2.text = nil
        }else if counterNum1 != nil {
            counterNum1 = nil
            
            currentValueLB1.text = nil
        }
        
    }
    
    //랜덤 버튼 구현 - 강사님 코드
    func makeRandomNumber() -> [Int] {
        
        var randomNumberList:[Int] = []
        
        while randomNumberList.count < 3 {
            let randomNum: Int = Int(arc4random_uniform(10))
            
            if !randomNumberList.contains(randomNum) {
                randomNumberList.append(randomNum)
            }
        }
        
        print(randomNumberList)
        return randomNumberList
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

