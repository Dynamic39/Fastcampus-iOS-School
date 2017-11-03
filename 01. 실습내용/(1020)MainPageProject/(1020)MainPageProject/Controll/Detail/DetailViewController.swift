//
//  DetailViewController.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var descriptionLb: UITextView!
    
    @IBOutlet weak var phoneNumLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    
    var data:ProfileModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let real = data
        {
            nameLb.text = real.nickname
            bgImageView.image = UIImage(named: (real.backgroundImage))
            profileImageView.image = UIImage(named: (real.profileImage))
            descriptionLb.text = real.statusDescription
            
            phoneNumLb.text = real.phoneNumber
            emailLb.text = real.email
            
        }
        
        // 프로필 이미지 동그랗게 만들기
        profileImageView.layer.cornerRadius = profileImageView.bounds.size.width / 2
        profileImageView.layer.borderColor = UIColor.black.cgColor
        
        profileImageView.layer.borderWidth = 1
        profileImageView.clipsToBounds = true
        
    }
    
    func logOut(){
        
        let navi = self.navigationController as! MainNavi
        navi.login()
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
