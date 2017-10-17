//
//  BMWCustomView.swift
//  DelegateSample
//
//  Created by Samuel K on 2017. 10. 12..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class BMWCustomView: UIView {

    //클래스 내부에 프로토콜을 불러와 사용할 변수를 생성
    var delegate:BMWCustomViewDelegate?

    //뷰 화면중, 타이틀을 연결하는 아웃렛 변수 생성
    @IBOutlet var BmwCarNames:UILabel!
    //뷰 화면중, 이미지를 연결하는 아웃렛 변수 생성
    @IBOutlet var BmwCarImages:UIImageView!
    //뷰 화면중, 스위치를 관리하는 아웃렛 변수 생성
    @IBOutlet var BmwCarSwitch:UISwitch!
    
    
    //뷰 화면중, 스위치를 연결하는 액션 버튼 생성
    @IBAction func uiSwitch(_ sender:UISwitch) {
        delegate?.SwitchSelected(self)
    }
    
    //뷰화면이 로드되었을때, 처음 실행되는 구간을 설정
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}

protocol BMWCustomViewDelegate {
    
    func SwitchSelected(_ bmwCustomView:BMWCustomView)
    
}
