//
//  ViewController.swift
//  tableViewPractice
//
//  Created by Samuel K on 2017. 9. 29..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView:UITableView = UITableView(frame: view.bounds, style: .plain)
        
        //테이블 뷰 사용시 기본적으로 두개는 설정을 하고 만듬.
        tableView.dataSource = self
        tableView.delegate = self
        
        //테이블 뷰 레지스터 등록을 통해, 셀에 있는 값을 테이블 뷰에 붙인다.
        //셀 클래스 받아오는 경우 : 클래스, Nib : UI를 받아옴. 다음은 클래스로 가져옴
        //여기에서 self는 클래스 자체를 가지고 있음, 인스턴스가 된 것이 아님
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //Identifier는, cell의 class이름을 받아오는 것이 가장 중복이 되지 않는다.
        
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tableView)
    }
    
    //임의의 데이터 실행
    
    let pokemon:[String] = ["1", "2", "3", "4", "5", "6", "7"]
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    //테이블 뷰의 열을 설정한다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemon.count
        
    }
    
    
    //셀을 생성하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            
            cell.textLabel?.text = pokemon[indexPath.row]
            
            return cell
        
        } else {
        
        
        //재사용을 하는 변수를 생성해줌 통상적으로 cell을 사용함
        //deque -> que라는 곳에서 데이터를 붙러오는 것을 deque 라고 함 -> 재사용 cell을 끄집어 내는 역할을 함.
        //deque의 경우 자료가 있으면 queue에서 꺼내주고, 없으면 넣어주는 역할을 함.
        //dequeue가 실행될 때, talbleViewCell 의 클래스를 인스턴스로 전환해 준다. 커스템 셀을 쓰기위해 다운캐스팅 작업을 실시한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        //셀에서 스트링을 가지고 올때
        //cell.textLabel?.text = pokemon[indexPath.row]
        
        cell.setImage(name: pokemon[indexPath.row])
        
        return cell
            
        }
        
        
        
        
    }
    
    //셀을 selected되었을때, 메서드
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //slected 된 데이터를 가져옴
        let name = pokemon[indexPath.row]
        
        //알럿 컨트롤러 클래스를 인스턴스로 만듬
        let pokemonAlert:UIAlertController = UIAlertController(title: "포케몬 이름", message: "\(name) 포켓몬이 선택되었습니다.", preferredStyle: .alert)
        //액션 키의 클래스를 인스턴스로 생성함
        let action:UIAlertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        //UI컨트롤러에 액션 인스턴스를 삽입
        pokemonAlert.addAction(action)
        
        //뷰에서 해당 인스턴스를 표기 하기 위하여, 프레젠트 해줌
        present(pokemonAlert, animated: true, completion: nil)
        
        
    }
    
    //셀의 높이를 설정하는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //업데이트 레이아웃(커스텀 셀)에서 가져오거나, 해당 사이즈를 먼저 인스턴스가 되도록 해줘야함.

        
        
        return 250
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
