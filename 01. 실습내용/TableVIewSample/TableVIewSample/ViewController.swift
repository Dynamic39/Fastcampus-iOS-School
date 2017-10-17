//
//  ViewController.swift
//  TableVIewSample
//
//  Created by Samuel K on 2017. 9. 29..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
                //UIView
        createUIView()
        updateLayout()
        
 

        
        
        //UILbel - 텍스트, UIImageView - 이미지, UIScrollView - 여러개의 뷰
        
        //UIScrollView
        //UITableView
        //UICollectionView
        
        //UIControl - addTarget
        //UIButton, UISwitch, UISegmentController, UISlider, UITextField,
        
        //인스턴스 만들기, 생성 사용에 대한 숙지,
        
        //FrameBase연습 -> Autolayout
        
        //MVC패턴에 대한 이해가 있어야함
        

        //재사용의 개념이 들어감.
        
        
        
        
    }
    
    //테이블 뷰 작성시, tableViewDataSource와, tableviewDelegate를 선언해야줘야 한다.
    func makeTableView(){
        
        let tableView:UITableView = UITableView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height:view.frame.size.height), style: .plain)
        
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
    }
    
    //전체 섹션의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //각 셀을 몇개씩 가지고 오는지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    //각각의 셀들을 설정하는 값
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        
        return cell
        
    }
    
    
    
    
    //viewDidLoad의 경우, UI를 직접 만드는 공간이 아니기 때문에, 메서드를 사용한다
    //메모리 관리 차원 및 다른 메서드에서 공통적으로 사용하기 위해, weak 를 사용하여, 옵셔널 UIView를 생성한다.
    weak var subView:UIView?
    weak var lb:UILabel?
    weak var uiBtn:UIButton?
    weak var scrollView:UIScrollView?
    
    func createUIView() {
        
        let subView:UIView = UIView()
        //UIView
        subView.backgroundColor = UIColor(red: 122/255, green: 0.5, blue: 0.5, alpha: 1)
        
        //뷰를 구분짓기 위해 만듬
        subView.tag = 1
        
        //뷰에 추가를 함
        self.view.addSubview(subView)
        self.subView = subView
        
        //UILabel
        let lb:UILabel = UILabel()
        lb.attributedText = NSAttributedString(string: "안녕 친구야", attributes:
            [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue])
        
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.tag = 100
        lb.backgroundColor = .green
        lb.alpha = 0.5
        view.addSubview(lb)
        self.lb = lb
        
        //커스텀을 하고자 할때, 처음 인스턴스 생성시, 타입 지정을 해줘야함)
        let uiBtn:UIButton = UIButton()
        //상태 선택을 해줘야함
        uiBtn.setTitle("버튼이름", for: .normal)
        uiBtn.setTitle("하이라이트 상태", for: .highlighted)
        uiBtn.backgroundColor = .red
        
        //타게팅을 받는 메소드를 호출 해줘야함(selector)를 사용함.
        uiBtn.addTarget(self, action: #selector(self.btnAction), for: .touchUpOutside)
        self.uiBtn = uiBtn
        
        
        //UIScrollView
        
        let scrollView:UIScrollView = UIScrollView()
        scrollView.delegate = self
        self.scrollView = scrollView
        self.view.addSubview(scrollView)
        scrollView.addSubview(uiBtn)

        
    }
    
    
    
    //레이아웃을 다른 메서드를 통하여, 구현한다.
    
    func btnAction(_ sender:UIButton){
        
    }
    
    func updateLayout(){
    
        
        let screenSizeWidth:CGFloat = view.frame.size.width
        
        let sizeManagement:CGFloat = 100
        subView?.frame = CGRect(x: 0, y: 0, width: sizeManagement, height: sizeManagement)
        lb?.frame = CGRect(x: 100, y: 0, width: sizeManagement, height: sizeManagement)
        
        uiBtn?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        
        scrollView?.frame = CGRect(x: 0, y: 100, width: screenSizeWidth, height: sizeManagement)
        scrollView?.contentSize = CGSize(width:(scrollView?.frame.size.width)!*10, height: 100)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

