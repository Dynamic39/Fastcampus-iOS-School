//
//  TestCell.swift
//  (1027)CollectionView
//
//  Created by Samuel K on 2017. 10. 27..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class TestCell: UICollectionViewCell {
    
    @IBOutlet weak var textLB:UILabel!
    
    
    override var isSelected: Bool {
        willSet{
            if newValue
            {
                self.layer.borderColor = UIColor.red.cgColor
                self.layer.borderWidth = 5
            }
            
            self.layer.borderColor = nil
            self.layer.borderWidth = 0.5
        }
    }
    
}
