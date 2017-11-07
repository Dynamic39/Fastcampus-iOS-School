//
//  ViewController.swift
//  (1106)OperationSample
//
//  Created by Samuel K on 2017. 11. 6..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var testLB: UILabel!
    
    var timer:Timer?
    var isRunning = false
    
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    @IBOutlet var image5: UIImageView!
    @IBOutlet var image6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        
    }
    
    func loadImage() {
        
        DispatchQueue.global().async {
            
            if let imageTest1 = try? Data(contentsOf: URL(string: "http://i.imgur.com/m2Nj9hJ.png")!)
            {
                DispatchQueue.main.async {
                    self.image1.image = UIImage(data: imageTest1)
                }
            }
            
            if let imageTest2 = try? Data(contentsOf: URL(string: "http://goos.wiki/images/1/1e/%ED%8A%B8%EC%99%80%EC%9D%B4%EC%8A%A4.jpg")!)
            {
                DispatchQueue.main.async {
                    self.image2.image = UIImage(data: imageTest2)
                }
            }
            
            if let imageTest3 = try? Data(contentsOf: URL(string: "http://uhd.img.topstarnews.net/wys3/file_attach/2016/03/16/1458111417-10-org.jpg")!)
            {
                DispatchQueue.main.async {
                    self.image3.image = UIImage(data: imageTest3)
                }
            }
            
            if let imageTest4 = try? Data(contentsOf: URL(string: "https://i.ytimg.com/vi/qt_JdFWGriI/maxresdefault.jpg")!)
            {
                DispatchQueue.main.async {
                    self.image4.image = UIImage(data: imageTest4)
                }
            }
            
            if let imageTest5 = try? Data(contentsOf: URL(string: "http://www.xportsnews.com/contents/images/upload/article/2017/0630/1498794668947643.jpg")!)
            {
                DispatchQueue.main.async {
                    self.image5.image = UIImage(data: imageTest5)
                }
            }
            
            if let imageTest6 = try? Data(contentsOf: URL(string: "http://www.xportsnews.com/contents/images/upload/article/2017/0928/1506582790853442.jpg")!)
            {
                DispatchQueue.main.async {
                    self.image6.image = UIImage(data: imageTest6)
                }
            }
            
        }
        
        
    }
    
    @IBAction func someAction(_ sender: Any) {
        
        longTimeAction()
        
        testLB.text = "시작을 누르면 실행합니다."
        
    }
    
    
    
    func longTimeAction()
    {

        var total = 0
        if isRunning == false
        {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
                
                self.testLB.text = String(total)
                total += 1
                print(total)
            }
        } else {
          timer?.invalidate()
            total = 0
            isRunning = false
        }
    }
    
    func stopAction(){
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// 큐를 분할로 나눠서 하는 예(extension 사용!)
extension UIImageView
{
    func imageForURL(_ url:URL)
    {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
    
    
    
    
    
    
}

