//
//  CustomView.swift
//  DelegateSample
//
//  Created by Samuel K on 2017. 10. 12..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet var titleLB:UILabel!
    
    var delegate:CustomViewDelegate?
    //뷰컨트롤러의 viewDidLoad의 기능을 수행함.
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func changeText(newText:String) {
        
    }
    
    @IBAction func btnSelected(_ sender:UIButton) {
        delegate?.didSelectedCustomView(self)
    }
    
}


protocol CustomViewDelegate {
    
    //파라미터를 자기 자신을 받는 메서드를 만든다.
    func didSelectedCustomView(_ customView:CustomView)
    
}

