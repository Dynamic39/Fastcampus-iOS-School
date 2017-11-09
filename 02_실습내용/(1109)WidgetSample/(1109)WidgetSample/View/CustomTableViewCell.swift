//
//  CustomTableViewCell.swift
//  (1109)WidgetSample
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subimageView:UIImageView!
    @IBOutlet weak var titleLB:UILabel!
    @IBOutlet weak var starBtn:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
