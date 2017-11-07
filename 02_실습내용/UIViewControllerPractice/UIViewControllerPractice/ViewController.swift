//
//  ViewController.swift
//  UIViewControllerPractice
//
//  Created by Samuel K on 2017. 10. 10..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subTableview:UITableView = UITableView(frame: view.bounds)
        subTableview.dataSource = self
        subTableview.delegate = self
        subTableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(subTableview)
        
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
    
    // 선택한 셀에 대하여 추가 액션 기능을 시행한다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //다음 인스턴스에 대한 뷰 컨트롤러를 만든다.
        
        //세컨 뷰 컨트롤러를 실행하여 인스턴스화 시킨다.
        //하지만 스토리 보드와 아이디와 일치하지 않기 때문에, 원하는 값이 인스턴스화 되지 않는다.
        //이렇게 하면 안된다.
        //let secondViewController = SecondViewController()
        
        //스토리보드의 이름을 불러온다. - 스토리 보드는 복수로 생성이 가능하다 - 다음은 새로운 스토리 보드를 만들고, 불러오는 내용
        let storyBoard = UIStoryboard(name: "SubStoryboard", bundle: nil)
        //새롭게 만들어진 스토리 보드안에 있는 이동하려는 뷰 컨트롤러의 ID값을 입력하여, 스토리보드에 있는 UIVIew에 이동할 수 있게 해준다. 인스턴스가 생성된다
    
        //다운 캐스팅을 통하여, 특정 뷰컨트롤러를 다운캐스팅 해서 지정함으로써, 해당 뷰 컨트롤러(SecondViewController) 안에 있는 클래스들의 메소드를 사용할 수 있다.
        
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        
        //현재 뷰컨트롤러가 속해 있는 스토리보드를 셀프를 사용하여 불러오는 것도 가능하다. 위에 값과 하기의 값은 기본적으로 다르게 세팅된 인스턴스(스토리 보드 내용에 따라)가 호출된다.
        //let secondVC2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        //새롭게 인스턴스가 생성된 secondVC를 테이블뷰 셀이 선택된 후, 보여지도록 하는 코드를 작성한다.
        present(secondVC, animated: true, completion: nil)
        
        //메인에 있는 스토뷰에 있는 뷰 컨트롤러(SecondViewController)로 전환된다
        //present(secondVC2, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

