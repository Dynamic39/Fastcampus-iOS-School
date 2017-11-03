//
//  ProfileInfoViewController.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 25..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ProfileInfoViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    
    @IBOutlet weak var UesrIDTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //알림센터를 통하여, 키보드의 값을 확인함.
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (noti) in
            print(noti.userInfo ?? "없음")
            
            //키보드가 올라오는 것에 대한 처리
            if  let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect
            {
                //세팅된 스크롤의 값을 올려서 사용한다. 클로저가 아니기 때문에 셀프를 붙여야 한다.
//                self.scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
                self.scrollView.contentInset.bottom = keyboardFrame.size.height + 20
            }
        }
        
        
        // -> 조교님한테 물어볼것
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (noti) in
            
//                self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
            self.scrollView.contentInset = UIEdgeInsets.zero
        }
        
        
        uiUpdate()
        
    }
    
    func uiUpdate() {
        
        profileImage.layer.cornerRadius = self.profileImage.bounds.height/2
        profileImage.clipsToBounds = true
        if let imgData = UserDefaults.standard.value(forKey: "profileImageData") as? Data {
            
            profileImage.image = UIImage(data: imgData)
        }
    }
    
    
    
    //키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    
    //사진을 눌렀을때, 메서드
    @IBAction func modifyImgAction(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "골라", message: "초이스", preferredStyle: .actionSheet)
        
        
        //카메라 기능이 있는경우, 다음 인스턴스를 실행
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
        //카메라 구동
        let cameraAction = UIAlertAction(title: "카메라", style: .default) { (action) in
            
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = .camera
            imgPicker.delegate = self
            self.present(imgPicker, animated: true, completion: nil)
            
        }
         actionSheet.addAction(cameraAction)
            
        }
        
        //사진기 구동
        let photoAction = UIAlertAction(title: "사진", style: .default) { (action) in
            
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = .savedPhotosAlbum
            imgPicker.delegate = self
            self.present(imgPicker, animated: true, completion: nil)
            
        }
        //액션 시트를 호출!
        actionSheet.addAction(photoAction)
        self.present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    
    
    
    //피커에서 사진을 선택하지 않고, 캔슬을 눌렀을때, 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        
        //이미지를 지정함
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
          profileImage.image = img
        }
        
        //이미지를 저장함
        
        if let url = info[UIImagePickerControllerImageURL] as? URL{
            if let data = try? Data(contentsOf: url){
               profileImage.image = UIImage(data: data)
                
                UserDefaults.standard.set(data, forKey: "profileImageData")
            }
        }
      
        
        
        picker.dismiss(animated: true, completion: nil)
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
