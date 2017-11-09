//
//  LoginViewController.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 7..
//  Copyright © 2017년 Samuel K. All rights reserved.
//


/*
 구현해야 되는 기능
 
 - 로그인 - OK
 - 각 텍스트 필드 연동(텍스트 필드 2개, 로그인 버튼, 신규가입 버튼 생성) - OK
 - 오토 레이아웃 설정 - OK
 - 텍스트 필드와 UserDefault 일치 여부 확인 - OK
 - 일치하지 않으면, Alert을 띄워서 신규 가입화면으로 전환 유도
 - 키보드 이외의 부분을 터치 할 경우, 키보드가 없어지도록 만든다. - OK
 
 */

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    //버튼을 아웃렛으로 연결하여, 편집을 진행 할 수 있도록 해준다.
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var registerBtn: UIButton!
    
    //텍스트 필드를 연결하여 사용자로부터 입력값을 받아 올 수 있도록 구현한다.
    @IBOutlet var IDtextfield: UITextField!
    @IBOutlet var PWtextfield: UITextField!
    
    var isLoginCondition:Bool!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        isLoginCondition = false
        
        loginBtn.layer.cornerRadius = 12
        registerBtn.layer.cornerRadius = 12

    }
    
    // MARK: 로그인 화면 구현
    //로그인 버튼을 눌렀을 때, 아이디/패스워드를 확인하는 기능을 구현
    @IBAction func loginAct(_ sender: Any) {
        
        let isLoginSucess:Bool = idpwChecker()
        
        if isLoginSucess {
            
            isLoginCondition = true
            print("다음화면으로 넘어갑니다")
            let alert = UIAlertController(title: "로그인 성공!", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler:{(action) in
                
                // 다음 테이블 뷰 컨트롤러로 넘어가게 함!
                //네비게이션 넘어가는 부분 학습할 것, 시작점이 네비게이션 컨트롤러기 때문에, 네비게이션 루트뷰 쪽으로 넘겨줘서 실행을 시켜줘야 한다.
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tableVC = storyboard.instantiateViewController(withIdentifier: "nextView") as? UINavigationController
                self.present(tableVC!, animated: true, completion: nil)
                
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            
        }
    }
    
    
    //아이디와 패스워드가 제대로 기재되었는지 확인한다. 리턴값을 줌으로서, 리턴시, 해당 for문이 종료되도록 진행한다.
    func idpwChecker() -> Bool {
        
        let id = IDtextfield.text
        let pw = PWtextfield.text
        
        
        //아이디와 비밀번호를 포함할 빈배열을 선언한다.
        //해당아이템은 추가로 저장하거나, UserDefaults값을 조회할때 사용된다.
        var userList:[[String:String]]
        
        
        //옵셔널 바인딩을 사용하여, 빈배열의 경우 새로 생성해주고, 그렇지 않은 경우 해당 데이터를 집어 넣는다.
        
        if let userData = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
            userList = userData
        }else{
            userList = []
        }
        print(userList)
        
        //for문을 실행하여 아이디와 패스워드가 일치하는 지 확인한다.
        
        for check in userList {
            
            if id == check["ID"] && pw == check["PW"] {
                    print("로그인에 성공하였습니다!")
                return true
            }else if id == check["ID"] && pw != check["PW"] {
                print("비밀번호가 잘못되었습니다. 다시 입력하여 주세요!")
                let alert = UIAlertController(title: "비밀번호 오류", message: "비밀번호를 확인하여 주십시오.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                return false
            }
        }
        print("아이디가 없습니다.")
        let alert = UIAlertController(title: "아이디가 없습니다.", message: "신규가입을 진행하여 주세요!", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        return false
    }
    
    
    //텍스트 필드를 클릭 하였을시, 키보드가 내려가는 메서드를 구현
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        IDtextfield.resignFirstResponder()
        PWtextfield.resignFirstResponder()
        return true
    }
    
    //임의의 지점이 터치될 때, 키보드가 내려가는 메서드를 구현
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
