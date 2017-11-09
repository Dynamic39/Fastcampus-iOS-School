//
//  UploadViewController.swift
//  (1109)WidgetSample
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    
    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var callCamera: UIButton!
    
    var textArray:[String]?
    var imageArray:[Data]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    @IBAction func savedBtn(_ sender: Any) {
        textCheck()
        popNavi()
        
    }
    
    func textCheck() {
        
        if let userArray = UserDefaults.standard.array(forKey: "text") as? [String] {
            textArray = userArray
        }else{
            textArray = []
        }
        
        textArray?.append(inputTextfield.text!)
        UserDefaults.standard.set(textArray, forKey: "text")
    }
    
    func popNavi(){
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let tableView = storyboard.instantiateViewController(withIdentifier: "ViewController")
//        self.navigationController?.popToViewController(tableView, animated: true)
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        
        let cameraController = UIImagePickerController()
        cameraController.delegate = self
        cameraController.sourceType = .photoLibrary
        
        present(cameraController, animated: true, completion: nil)
        
        
    }
    
}

extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("정보를 호출합니다. : ", info)
        
        dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

    
}
