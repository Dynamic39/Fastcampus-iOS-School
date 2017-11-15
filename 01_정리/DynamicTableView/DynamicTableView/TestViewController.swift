//
//  TestViewController.swift
//  DynamicTableView
//
//  Created by Samuel K on 2017. 11. 9..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

class TestViewController: PTDetailViewController  {

    
    func backButtonHandler() {
        popViewController()
    }
    
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // create viewController
        let TestViewController = storyboard?.instantiateViewControllerWithIdentifier("test")
        if case let viewController as TestViewController = viewController {
            pushViewController(viewController)
        }
    }
    
    
    // transparent background
    UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().translucent = true
    UINavigationBar.appearance().tintColor = .whiteColor()
    
    // set font
    if let font = UIFont(name: <Font name> , size: 18) {
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : font
        ]
    }
    
    
    


    


}
