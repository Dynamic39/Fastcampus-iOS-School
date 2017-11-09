//
//  ProfileViewController.swift
//  (1106)idolProfile
//
//  Created by Samuel K on 2017. 11. 8..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    var profile:IdolDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile = IdolDataModel()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
}

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
