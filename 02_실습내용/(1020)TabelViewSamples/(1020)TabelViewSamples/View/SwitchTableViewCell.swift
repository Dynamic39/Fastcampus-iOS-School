//
//  SwitchTableViewCell.swift
//  (1020)TabelViewSamples
//
//  Created by Samuel K on 2017. 10. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    @IBOutlet var switchBtn:UISwitch!
    
    
    //인덱스 패스 값을 받는 옵셔널 프로퍼티 설정
    var indexPath:IndexPath?
    var delegate:SwitchTableViewCellDelegate?
    
    var switchData:Bool = true {
        willSet{
            self.switchBtn.isOn = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switcherValueChanged(_ sender:UISwitch) {
        
        print(sender.isOn, indexPath!.row)
        delegate?.switchTableViewCell(cell: self, didChangedSwitch: sender.isOn)
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


protocol SwitchTableViewCellDelegate
{
    func switchTableViewCell(cell:SwitchTableViewCell, didChangedSwitch value:Bool)
    
}
