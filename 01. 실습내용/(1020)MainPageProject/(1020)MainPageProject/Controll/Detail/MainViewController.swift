//
//  MainViewController.swift
//  (1020)MainPageProject
//
//  Created by Samuel K on 2017. 10. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataManager:profileDataManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // lazy를 사용하여, 클래스 내부에서 선언해줘도 됨.
        dataManager = profileDataManager()
    
        tableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return dataManager?.profilesData.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell
        
        let profileModel:ProfileModel = dataManager!.profilesData[indexPath.row]
        
        cell?.data = profileModel
        
        cell?.textLabel?.text = profileModel.nickname
        cell?.detailTextLabel?.text = profileModel.statusDescription
        cell?.imageView?.image = UIImage(named: profileModel.profileImage)
            
        
        return cell!
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? ProfileTableViewCell else { return }
        guard let nextVC = segue.destination as? DetailViewController else { return }
        
        nextVC.data = cell.data
        print(nextVC)
        
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
