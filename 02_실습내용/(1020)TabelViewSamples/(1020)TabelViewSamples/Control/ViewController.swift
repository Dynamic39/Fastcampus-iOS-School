//
//  ViewController.swift
//  (1020)TabelViewSamples
//
//  Created by Samuel K on 2017. 10. 20..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchTableViewCellDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var onOffList = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.tableHeaderView = UIView()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return onOffList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchTableViewCell
        
        cell.delegate = self
        cell.textLabel?.text = "\(indexPath.row)"
        
        cell.switchData = onOffList[indexPath.row]
        
        cell.indexPath = indexPath
        return cell
        
    }
    
    func switchTableViewCell(cell: SwitchTableViewCell, didChangedSwitch value: Bool) {
        print("Chage Switch \(cell.indexPath!.row)")
        onOffList[(cell.indexPath?.row)!] = value
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

