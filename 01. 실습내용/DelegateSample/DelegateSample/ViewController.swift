//
//  ViewController.swift
//  DelegateSample
//
//  Created by Samuel K on 2017. 10. 12..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate, BMWCustomViewDelegate {
    
    //라벨 관련 샘픔
    @IBOutlet var newView:CustomView!
    @IBOutlet var newLabel:UILabel!

    
    //bmw차종 변경 관련하여, 아웃렛 설정
    @IBOutlet var bmwView:BMWCustomView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newView.changeText(newText: "뷰컨에서 설정")
        newView.delegate = self
        newView.titleLB.text = "타이틀 변경"
        
        
        bmwView.delegate = self
        bmwView.BmwCarImages.image = UIImage(named: "BMW")
        
        
        
    }
    
    //스위치가 눌렸을때, 지정
    func SwitchSelected(_ bmwCustomView: BMWCustomView) {
        
        if bmwView.BmwCarSwitch.isOn {
            bmwView.BmwCarNames.text = "BMW3!"
            bmwView.BmwCarImages.image = UIImage(named: "BMW3")
        }else{
            bmwView.BmwCarNames.text = "BMW5!"
            bmwView.BmwCarImages.image = UIImage(named: "BMW5")
        }
        
        
    }
    
    func didSelectedCustomView(_ customView: CustomView) {
        newLabel.text = "자동으로 변경됨"
        
        customView.titleLB.text = "델리게이트에서 변경"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

