//
//  SecondViewController.swift
//  UIViewControllerPractice
//
//  Created by Samuel K on 2017. 10. 10..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var displayLB: UILabel!
    
    var sendedMsg:String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //뒤로 가기위한 버튼을 만듬
//        let closeBtn = UIButton()
//        closeBtn.frame = CGRect(x: 50, y: 50, width: 50, height: 30)
//        closeBtn.setTitle("닫기", for: .normal)
//        closeBtn.setTitleColor(.black, for: .normal)
//
//        closeBtn.addTarget(self, action: #selector(closeAct), for: .touchUpInside)
//        view.addSubview(closeBtn)
        
        displayLB.text = sendedMsg
        print("viewDidLoad")
    }
    
    
    @objc func closeAct(_ sender:UIButton){
        
        //뒤로 돌아가는 화면을 만듬
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    func sendMsg(_ msg:String) {
        
        sendedMsg = msg
        print("sendMsg")
        
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
