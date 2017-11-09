//
//  ProfileViewController.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 8..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //프로필 데이터를 선언하여, 사용할 수 있게 합니다.
    @IBOutlet var tableView: UITableView!
    var profile:IdolDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DataModel을 사용 할 수 있도록 진행합니다.
        profile = IdolDataModel()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
}


//extension 처리하여, tableViewData들을 활용 할 수 있도록 한다.
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowNumber = profile?.IdolsInfo.count
        
        return rowNumber!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewController", for: indexPath) as? CustomTableViewCell
        
        let basicData = profile?.IdolsInfo[indexPath.row]
        
        cell?.profileimage.image = UIImage(named: (basicData?.mainimage)!)
        cell?.nickName.text = basicData?.name
        cell?.status.text = basicData?.status
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
