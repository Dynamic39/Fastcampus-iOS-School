//
//  MyCustomCellTableViewCell.swift
//  tableViewPractice
//
//  Created by Samuel K on 2017. 9. 29..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         createView()
    }
    
    
    //Custom Cell을 만들때 해야함.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
       
        
    }
    
    //백그라운드 이미지 설정
    var bgImgView:UIImageView?
    
    func createView(){
        
        bgImgView = UIImageView()
        self.addSubview(bgImgView!)
        
    }
    
    
    //이미지뷰의 이미지를 UIImage를 세팅함
    func setImage(name:String){
        
        bgImgView?.image = UIImage(named: name)
        
    }
    //서브뷰의 레이아웃을 설정함
    override func layoutSubviews() {
        updateLayout()
    }
    
    //크기를 설정함
    func updateLayout() {
        
        bgImgView?.frame = self.bounds
    }

}
