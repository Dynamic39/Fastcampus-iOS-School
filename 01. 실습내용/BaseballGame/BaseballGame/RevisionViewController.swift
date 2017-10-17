//
//  RevisionViewController.swift
//  BaseballGame
//
//  Created by Samuel K on 2017. 9. 22..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class RevisionViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var currentLB1: UILabel!
    @IBOutlet weak var currentLB2: UILabel!
    @IBOutlet weak var currentLB3: UILabel!
    
    @IBOutlet weak var historytextView: UITextView!
    
    var isRunning = false

    
    //최초 정답에 대한 Array 및 입력 Array 생성
    
    // 임시로 코렉트 넘버 생성
    var correctAnswer:[Int] = [1, 2, 3]
    var inputAnswer:[Int] = []


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func start(_ sender: UIButton) {
        
        isRunning = true
        
        correctAnswer = makeRandomNum()
        print(correctAnswer)
        
    }
    
    
    //버튼이 눌렸을때, 각 라벨에 데이터를 넣어주는 역할을 함.
    //동시에 inputAnswer 에 데이터를 집어넣어야함 (최대 입력 가능한 인덱스는 2까지)
    //1번 라벨에 데이터가 들어 있는 경우, 다음 데이터로 들어감
    //인풋 엔서에 중복 데이터가 있는 경우, 입력 거부 !
    // 러닝 상태일때 동작함
    @IBAction func inputNumBtn(_ sender: UIButton) {
    
        if isRunning && !inputAnswer.contains(sender.tag) && inputAnswer.count < 3 {
            inputAnswer.append(sender.tag)
            print(inputAnswer)
            
            if currentLB1.text != String(inputAnswer[0]) {
                currentLB1.text = String(inputAnswer[0])
            }else if currentLB2.text != String(inputAnswer[1]) {
                currentLB2.text = String(inputAnswer[1])
            }else if currentLB3.text != String(inputAnswer[2]) {
                currentLB3.text = String(inputAnswer[2])
                
            }
            
        }
        
        

    }
    
    @IBAction func checkBtn(_ sender: UIButton) {
        
        var strikeCount: Int = 0
        var ballCount: Int = 0
        var outCount: Int = 0
        
        if inputAnswer.count == 3 {
        for count in 0..<inputAnswer.count {
            let checkNum = inputAnswer[count]
            if correctAnswer.contains(checkNum){
                if correctAnswer[count] == checkNum {
                    
                    strikeCount += 1
                    
                }else {
                    
                    ballCount += 1
                }
                
            }else{
                outCount += 1
            }
        }
        
        print(strikeCount)
        print(ballCount)
        print(outCount)
        
        var resultStr: String = ""
        
        if strikeCount > 0 {
            resultStr += "\(strikeCount)S "
        }
        if ballCount > 0 {
            resultStr += "\(ballCount)B "
        }
        if outCount > 0 {
            resultStr += "\(outCount)O"
        }
        
        
        if strikeCount == 3 {
            resultLabel.text = "정답!!"
            makeClear()
            isRunning = false
            
        }else{
        resultLabel.text = resultStr
        print(resultStr)

        }
        
        historytextView.text! += resultStr + "\n"
        
        makeClear()
            
        } else {
            resultLabel.text = "3자리 숫자 입력!"
        }
        
        
        
    }
    
    func makeClear(){
        
        inputAnswer = []
        currentLB1.text = "0"
        currentLB2.text = "0"
        currentLB3.text = "0"
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
    }
    
    func makeRandomNum() -> [Int] {

        var randomAnswer:[Int] = []
    
        while randomAnswer.count < 3 {
            let ranNum = Int(arc4random_uniform(10))
            
            if !randomAnswer.contains(ranNum) {
                randomAnswer.append(ranNum)
            }
            
        }
        
        return randomAnswer
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
