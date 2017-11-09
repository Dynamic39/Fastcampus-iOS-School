//
//  LoginViewController.swift
//  loginController
//
//  Created by Samuel K on 2017. 9. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var userMailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var userInformation:[String:String] = [:]
    
    var userModel = UserModel()
    
    var userLogInformation:[String:Any] = ["userID":"Sam", "userPW":"Kyu", "userMail":"kang@gmail.com", "gender":1]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
        signUpButton.layer.cornerRadius = 10
        
        //let userLogin = LoginModel(dataDic: userLogInformation)
        
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
       guard let userName:String = userMailTextfield.text, !userName.isEmpty else {return}
       guard let userpassword:String = passwordTextfield.text, !userpassword.isEmpty else {return}
    
        //print(userName, userpassword)
        
        let isLoginSucess: Bool = findUser(name: userName, password: userpassword)

        if isLoginSucess {
            
            dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "isLogin")
            //알람 컨트롤러 설정
            
            let alertController = UIAlertController(title: "여기는 타이틀", message: "알람 메시지입니다.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                print("버튼이 클릭되었습니다")
                
                let main = MainViewController()
                self.present(main, animated: true, completion: nil)
                
            })
            
            let cancelAction = UIAlertAction(title: "CANCEL", style: .default, handler: { (alert) in
                print("캔슬 버튼이 클릭되었습니다.")
            })
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            self.present(alertController, animated: true, completion: nil)

            return
            
        }else{

        }
        userMailTextfield.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        passwordTextfield.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        print("로그인 실패")
        
        UIView.animate(withDuration: 0.1, animations: {
            
            self.userMailTextfield.frame.origin.x -= 10
            self.passwordTextfield.frame.origin.x -= 10
            
            
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.userMailTextfield.frame.origin.x += 20
                self.passwordTextfield.frame.origin.x += 20
                
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.userMailTextfield.frame.origin.x -= 10
                    self.passwordTextfield.frame.origin.x -= 10
                })
            })
        }
    }
    
    func findUser(name: String, password: String) -> Bool{
        
        /*
         1. 아이디가 유효한지
         2. 비밀번호가 맞는지
         */
        
        //배열에 있는 정보를 불러옴, 타입을 명시함
        guard let userList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] else { return false }
        
        //배열에 있는 정보를 검사함(가져오는 정보는 딕셔너리를 가져옴)
        for userData in userList {
            
            let memberID:String = userData["ID"]!
            if memberID == name {
                let memberPW:String = userData["PW"]!
                if memberPW == password{
                    
                    dismiss(animated: true, completion: nil)
                    return true
                    
                }
            }
        }
    
        
        return false
        

        
    }
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if let nextViewController = segue.destination as? SignUpViewController {
//            nextViewController.didTaskClosure = { (name: String, password: String) -> Void in
//                
//                self.userModel.addUser(name: name, password: password)
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? SignUpViewController {
            
            
            nextViewController.didTaskClosure = { (name: String, password: String) -> Void in

                self.userModel.addUser(name: name, password: password)
                
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
