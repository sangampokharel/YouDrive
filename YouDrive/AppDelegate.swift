//
//  AppDelegate.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .appBlackColor
        window?.rootViewController = UINavigationController(rootViewController:  MainViewController())
        
        return true
    }
}

