//
//  CustomTableViewCell.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 8..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var profileimage:UIImageView!
    @IBOutlet weak var nickName:UILabel!
    @IBOutlet weak var status:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView = UIImageView(image: #imageLiteral(resourceName: "background"))
        nickName.textColor = .white
        status.textColor = .white

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
