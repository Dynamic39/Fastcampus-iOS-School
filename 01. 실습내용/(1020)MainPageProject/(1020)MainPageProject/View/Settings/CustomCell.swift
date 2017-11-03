//
//  CustomCell.swift
//  (1022)SettingsTable
//
//  Created by Samuel K on 2017. 10. 22..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var tableLabel: UILabel!
    @IBOutlet weak var tableImage: UIImageView!
    
    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var versionLB: UILabel!
    
    
    //셀의 정보를 불러옴
    //스타일의 정보를 불러옴
    //모델링으로 부터
    var cellInformaiton:DetailData?{
        willSet{
            
            tableLabel.text = newValue?.contentData
            self.type = newValue!.style
        }
    }
    
    //스타일 정보에 대한 열거형 정보를 불러옴
    private var type:CellStyle = .baseType {
        didSet{
            changeUI()
        }
    }
    
    //var style = CellStyle()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
       // changeUI()
        

    }
    
    func changeUI() {

        switch type {

        case CellStyle.baseType :
            versionLB.isHidden = false
            switchBtn.isHidden = true
            accessoryType = .none
            self.selectionStyle = .none

        case CellStyle.detailType :

            versionLB.isHidden = true
            switchBtn.isHidden = true
            accessoryType = .disclosureIndicator


        case CellStyle.switchType :

            versionLB.isHidden = true
            switchBtn.isHidden = false
            accessoryType = .none
            
        case .buttonType:
            accessoryType = .none
            switchBtn.isHidden = true
            versionLB.isHidden = true
            tableLabel?.textColor = UIColor.red
            
            
            

        }
        
        
        

}
    // 버전 정보 업로드
    func showVersion() {
        
        versionLB.isHidden = false
        
        let infoDic = Bundle.main.infoDictionary
        
        let version = infoDic?["CFBundleShortVersionString"] as? String
        
        versionLB.text = version
        
    }
}
