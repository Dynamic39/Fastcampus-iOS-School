//
//  ViewController.swift
//  DynamicTableView
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit
import PreviewTransition

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    let images = ["test1", "tes2", "tes3", "tes4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        
//        guard let cell = cell as? ParallaxCell else {
//            return
//        }
//
//        let imageName = images[indexPath.row]
//
//        if let image = UIImage(named: imageName) {
//            cell.setImage(image, title: <SetText>)
//        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? ParallaxCell else {
            return
        }
        
        let imageName = images[indexPath.row]
        
        if let image = UIImage(named: imageName) {
            cell.setImage(image, title: "테스트!")
        }
        
        
    }
    
}

