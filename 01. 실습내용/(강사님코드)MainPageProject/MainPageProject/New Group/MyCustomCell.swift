//
//  MyCustomCell.swift
//  MainPageProject
//
//  Created by youngmin joo on 2017. 10. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit



class MyCustomCell: UITableViewCell {

    var cellData:CellDataModel?{
        willSet{
            self.textLabel?.text = newValue!.cellTitle
            self.type = newValue!.style
        }
    }
    
    private var type:CellType = .baseType{
        didSet{
            changeTypeUI()
        }
    }
    
    func changeTypeUI() {
        
        switch type {
        case .baseType:
            self.accessoryType = .none
            self.selectionStyle = .none
            switcher.isHidden = true
            versionLb.isHidden = true
            
        case .detailType:
            self.accessoryType = .disclosureIndicator
            switcher.isHidden = true
            versionLb.isHidden = true
            
        case .switchType:
            self.accessoryType = .none
            self.selectionStyle = .none
            switcher.isHidden = false
            versionLb.isHidden = true
            
        case .buttonType:
            self.accessoryType = .none
            switcher.isHidden = true
            versionLb.isHidden = true
            self.textLabel?.textColor = UIColor.red
            
        }
        
    }
    
    
    
    @IBOutlet var switcher:UISwitch!
    @IBOutlet var versionLb:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        switcher.isHidden = true
        versionLb.isHidden = true
        self.accessoryType = .none
        
    }
    
    func showVesion()
    {
        versionLb.isHidden = false
        
        let infoDic = Bundle.main.infoDictionary
        print(infoDic?.keys)
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        versionLb.text = version
        
    }
    
}
