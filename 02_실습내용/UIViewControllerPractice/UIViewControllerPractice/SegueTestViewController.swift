//
//  SegueTestViewController.swift
//  UIViewControllerPractice
//
//  Created by Samuel K on 2017. 10. 10..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SegueTestViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var isAbleToNext:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ableToNextSwitch(_ sender: UISwitch) {
        
      isAbleToNext = sender.isOn
    }
    
    // 해당하는 값에 따라, 다음 segue과정을 진행 할지 않할지를 결정한다.
    // 해당하는 모든 seque를 제어한다
    // 특정 segue 지정도 가능하다.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "NextSecondVC" {
            return isAbleToNext
        }else{
        
        return isAbleToNext
        }
    }
    
    //화면 전환시, 특정 텍스트 필드의 텍스트를, 호출되는 뷰 컨트롤러의 특정 라벨에 값을 전달할 것.
    //prepare 메소드의 경우, 다음에 받은 뷰 컨트롤러의 viewdidLoad 이전에 작업이 완료되기 때문에, 자료 전달 시, 주의가 필요
    //받는 대상의 뷰 컨트롤러의 메소드를 끌어와 실행 하는 경우, viewdidLoad가 읽히기전(UI생성전)에 데이터를 요구, 입력 할 수 있으므로 크래시의 가능성이 있다.
    //따라서, 전역변수 설정등을 통하여, 데이터를 저장 후, viewdidLoad가 보일때, 데이터가 들어갈 수 있도록 흐름을 잡아주는 것이 중요
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //텍스트 필드의 정보를 담는 인스턴스 생성
        print("prepare")
        let sendStr = textField.text ?? "noText!"
        
        //세컨뷰 컨트롤러를 도착지로 설정한 인스턴스 생성
       let destinationVC = segue.destination as! SecondViewController
        
        //세컨뷰 컨트롤러의 특정 라벨에 텍스트 필드값의 데이터를 보내준다.
        destinationVC.sendMsg(sendStr)
        
    }
    
    //돌아가기 버튼을 만듬. 해당 버튼은 이전 뷰컨트롤러(프리젠트 된 부분의 버튼을 누르면 실행
    //실제 메소드 구성은, 돌아간 다음 나타난 뷰(이전 segue가 출발한 위치(원본)에서 시작된다
    
    @IBAction func dismissCompletion(_ seder:UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
