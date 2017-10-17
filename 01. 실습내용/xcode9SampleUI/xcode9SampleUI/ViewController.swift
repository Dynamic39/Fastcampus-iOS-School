//
//  ViewController.swift
//  xcode9SampleUI
//
//  Created by Samuel K on 2017. 10. 10..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subTableview:UITableView = UITableView(frame: view.bounds)
        subTableview.dataSource = self
        subTableview.delegate = self
        subTableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(subTableview)
        
//        let subView:UIView = UIView()
//        subView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        subView.backgroundColor = .red
//        self.view.addSubview(subView)
//
//
//        //Label, ImageView, UIbutton, UItextField, UIScrollView
//
//        let subLabel:UILabel = UILabel()
//        subLabel.frame = CGRect(x: 200, y: 0, width: 100, height: 100)
//        subLabel.backgroundColor = .blue
//        subLabel.text = "SUB라벨 테스트1"
//        view.addSubview(subLabel)
//
//        let subImageView:UIImageView = UIImageView()
//        subImageView.frame = CGRect(x: 200, y: 100, width: 200, height: 200)
//        subImageView.image = UIImage(named: "BMW-i8_ModelCard")
//        view.addSubview(subImageView)
//
//        let subButton:UIButton = UIButton()
//        subButton.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
//
//        view.addSubview(subButton)
//
//        let subTextfield:UITextField = UITextField()
//        subTextfield.frame = CGRect(x: 0, y: 300, width: 200, height: 50)
//        subTextfield.text = "텍스트 필드 테스트"
//        view.addSubview(subTextfield)
//
//
//        let subScrollView = UIScrollView(frame: view.bounds)
//        subScrollView.contentSize = CGSize(width: subScrollView.frame.size.width * 3, height: subScrollView.frame.size.height)
//        //delegate
//
//        //pageEnable
//
//        //contentsSize
//
//        let subView1:UIView = UIView()
//        subView1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        subView1.backgroundColor = .blue
//
//        let subView2:UIView = UIView()
//        subView2.frame = CGRect(x: subScrollView.frame.size.width * 2, y: 0, width: 300, height: 300)
//        subView2.backgroundColor = .red
//
//        let subView3:UIView = UIView()
//        subView3.frame = CGRect(x: subScrollView.frame.size.width * 3, y: 0, width: 300, height: 300)
//        subView3.backgroundColor = .green
//
//        view.addSubview(subScrollView)
//        subScrollView.addSubview(subView1)
//        subScrollView.addSuㅣbview(subView2)
//        subScrollView.addSubview(subView3)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "this is Cell"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

