//
//  AppDelegate.swift
//  NavigationControllerSample
//
//  Created by Samuel K on 2017. 10. 11..
//  Copyright © 2017년 Samuel K. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        /*
        //윈도우를 실행하여 준다. 현재 view가 생성되지 않았으므로, UIScreen을 사용하여, 해당 크기를 가져온다.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //ViewController 인스턴스 생성
        //1. 스토리 보드를 연결한다.
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리 보드안에 있는 특정 뷰 컨트롤러에 접근한다. (해당 뷰컨트롤러로, 다운캐스팅을 실시한다.)
        //이후 부터, 뷰컨트롤러와 연결되어 있는 스위프트 파일에 대한 접근 권한이 생긴다.
        let rootVC:ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let firstVC = UINavigationController(rootViewController: rootVC)
        
        let secondVC = ViewController()
        secondVC.view.backgroundColor = .green
        
        let tabbar = UITabBarController()
        tabbar.viewControllers = [firstVC, secondVC]
        
        //윈도우 위에 rootVC를 설정하여, 메인뷰 컨트롤러의 역할을 수행하게 한다.
        //window?.rootViewController = rootVC
        
        //윈도우 위에 루트뷰 컨트롤러를 설정하고, 그 위에 네비게이션 컨트롤러를 추가한다.
        //window?.rootViewController = naviController
        
        //윈도우 위에 탭바를 설정하고, 그 위에 루트뷰 컨트롤러를 포함한 네비게이션 컨트롤러, 그리고 뷰 컨트롤러를 시행한다.
        window?.rootViewController = tabbar
        
        //윈도우의 내용들을 볼수 있게 설정하여 준다.
        window?.makeKeyAndVisible()
         */
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

