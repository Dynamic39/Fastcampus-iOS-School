//
//  SignUpViewController.swift
//  loginController
//
//  Created by Samuel K on 2017. 9. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var createNewID: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    
    var didTaskClosure:((String, String) -> Void)? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        
        createNewID.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        inputPassword.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        checkPassword.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
    
    }
    
    
    // 액션
    
    
    @objc func didEndOnExit(_ sender: UITextField){
        
        if sender === createNewID {
            inputPassword.becomeFirstResponder()
            
        } else if sender === inputPassword {
            checkPassword.becomeFirstResponder()
            
        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        guard let newID:String = createNewID.text else { return }
        guard let newPassword:String = inputPassword.text else { return }
        guard let checknewpassword:String = checkPassword.text else { return }
        
        
        
        if newPassword == checknewpassword {
            print("ID등록이 성공적으로 이루어졌습니다.")
            print("신규등록 : \(newID), 비밀번호 : \(newPassword)")
            //didTaskClosure?(newID, newPassword)
            
            //빈배열을 생성하여, 디폴트 값에 저장해줌.
            
            var list:[[String:String]]
            
            //옵셔널 바인딩을 사용하여, 유저 디폴트 값이 nil 인지 확인한다. 그게 아닐 경우, 리스트를 넣어 준다.
            if let tempList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
                list = tempList
            }else{
                list = []
            }
            
            //유저 데이터의 딕셔너리 생성
            let userData:[String:String] = ["ID":newID,"PW":newPassword]
            list.append(userData)
            
            //생성한 딕셔너리를 배열에 인스턴스 값으로 전달
            UserDefaults.standard.set(list, forKey: "UserList")
  
//            UserDefaults.standard.set(newID, forKey: "ID")
//            UserDefaults.standard.set(newPassword, forKey: "PW")
   
            dismiss(animated: true, completion: nil)
            
        }else{
            
            print("입력하신 패스워드가 일치 하지 않습니다.")
        }
    }
    
    @IBAction func didTapExitButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    



}
