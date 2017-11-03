//
//  LoginViewController.swift
//  PsyTest
//
//  Created by Samuel K on 2017. 10. 18..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextfield: CustomTextfield!
    @IBOutlet weak var passwordTextfield: CustomTextfield!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        usernameTextfield.leftViewMode = .always
        
        passwordTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "key"))
        passwordTextfield.leftViewMode = .always
        
        
        usernameTextfield.configureAttributedString(usernameTextfield, string: "아이디를 입력해주세요", range: NSRange(location: 0, length: 3), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        
        passwordTextfield.configureAttributedString(passwordTextfield, string: "패스워드를 입력해주세요", range: NSRange(location: 0, length: 4), stringColor: UIColor.red.withAlphaComponent(0.5))
    
        // 알림 받기(키보드 위로 올리기)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        
        
        
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return true
//    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        //알림의 여러가지 정보들이 옴. 옵셔널이기 때문에, 바인딩 작업 필요함
        
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        //컨텐트 인셋부분을 수정하여 위로 올림.
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, (keyboardFrame.size.height)+30, 0)
        
    }
    
    //옵져빙한 결과를 받음
    @objc func keyboardWillHide(notification: NSNotification) {
        
        scrollView.contentInset = UIEdgeInsets.zero
        
    }
    
    
    @IBAction func didTapSignInButton(_ sender: RoundButton) {
        
        guard let username = usernameTextfield.text, !username.isEmpty else { return }
        guard let password = passwordTextfield.text, !password.isEmpty else { return }
        
        
        if UserService.sharedInstance.validateUserInfo(username: username, password: password) {
            
            //로그인 성공
            print("로그인 성공")
        } else {
            
            print("로그인 실패")
        }
            
            
        
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
