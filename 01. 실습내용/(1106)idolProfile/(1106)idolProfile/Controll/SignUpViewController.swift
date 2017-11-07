//
//  SignUpViewController.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 7..
//  Copyright © 2017년 Samuel K. All rights reserved.
//


/*
 
 구현해야 하는 기능
 
 - UserDefault에 새로운 값을 집어 넣는다. OK
 - 만약 새로운 값이 있는 경우, 에러코드를 띄워서 사용자에게 알람을 준다. OK
 - 신규 가입이 완료된 경우, dismiss 처리하여, 데이터가 쌓이는 것을 방지한다. OK
 
 */
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    //신규 가입 버튼의 아웃렛을 생성한다.
    @IBOutlet var NewRegisterBtn: UIButton!
    
    //각 텍스트 레이블에 대응하는 아웃렛을 생성한다.
    @IBOutlet var newIDTextfield: UITextField!
    @IBOutlet var newPWTextfield: UITextField!
    @IBOutlet var checkNewIDTextfield: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NewRegisterBtn.layer.cornerRadius = 12
        
    }
    
    
    
    //MARK : 저장화면 구성
    @IBAction func newRegisterAct(_ sender: Any) {
        
        idchecker()
    }
    
    //중복 아이디를 체크하고 중복아이디가 없을 경우, 새롭게 신규 등록한다.
    func idchecker() {
        
        //신규 아이디와 패스워드를 담을 배열을 구성
        
        //var newAccount:[[String:String]]
        
        if newPWTextfield.text == checkNewIDTextfield.text {
            
            registID()
            
        }else{
            print("비밀번호가 잘못되었습니다.")
            let alert = UIAlertController(title: "비밀번호 오류", message: "비밀번호가 잘못 입력되었습니다. 동일한 비밀번호를 입력하여 주십시오", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    //아이디를 등록하는 메서드를 구현한다.
    func registID(){
        
        //텍스트레이블에 빈칸이 없도록 처리 한다.
        let newID = newIDTextfield.text!
        let newPW = newPWTextfield.text!
        
        //아이디와 비밀번호를 포함할 빈배열을 선언한다.
        //해당아이템은 추가로 저장하거나, UserDefaults값을 조회할때 사용된다.
        var userList:[[String:String]]
        
        
        //옵셔널 바인딩을 사용하여, 빈배열의 경우 새로 생성해주고, 그렇지 않은 경우 해당 데이터를 집어 넣는다.
        
        if let userCurrentList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
            userList = userCurrentList
        }else{
            userList = []
        }
        
        // for문을 실행하여, UserDefaults 안에 있는 값을 하나씩 비교한다.
        for personalData in userList {
            
            let userID = personalData["ID"]
            if newID == userID {
                let alert = UIAlertController(title: "아이디 존재", message: "동일한 아이디가 존재합니다. 다른아이디로 등록하여 주십시오.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                
            }
        }
        //데이터의 중복이 없는 것을 확인 한 후, 새로운 아이디와 패스워드를 등록 한다.
        let userData = ["ID":newID, "PW":newPW]
        userList.append(userData)
        print(userList)
        UserDefaults.standard.set(userList, forKey: "UserList")
        
        let alert = UIAlertController(title: "등록 성공", message: "신규등록이 정상적으로 처리되었습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
            
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
