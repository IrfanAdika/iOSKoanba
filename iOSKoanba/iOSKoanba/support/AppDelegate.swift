//
//  AppDelegate.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let home = ViewController()
        let navigationContoller = UINavigationController(rootViewController: home)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationContoller
        window?.makeKeyAndVisible()
        
        return true
    }
}

