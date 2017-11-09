//
//  ViewController.swift
//  (1109)WidgetSample
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let textArray = UserDefaults.standard.object(forKey: "text") as? [String]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delaysContentTouches = false
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray?.count ?? 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        
        //cell?.subimageView.image = UIImage(named: )
        cell?.titleLB.text = textArray?[indexPath.row] ?? "데이터를 저장해주세요!"
        
        return cell!
        
    }
}



