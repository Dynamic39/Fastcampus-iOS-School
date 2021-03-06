//
//  CustomTextfield.swift
//  PsyTest
//
//  Created by Samuel K on 2017. 10. 18..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class CustomTextfield: UITextField {
    
    func configureAttributedString(_ textField:CustomTextfield,
                                   string:String,
                                   range:NSRange,
                                   stringColor:UIColor) {
        
        
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: stringColor, range: range)
    
        self.attributedPlaceholder = attributedString
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        let leftViewWidth = self.bounds.size.height / 2
        let resultRect = CGRect(x: 10, y: (self.bounds.size.height/2) - (leftViewWidth/2), width: leftViewWidth, height: leftViewWidth)
        
        return resultRect
        
    }
    

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
       return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height/2) + 30, 0, 0))
    }
    
    
    // 기타 하기 여백 확인하여 진행 할 것.
    
    
    
    

}
