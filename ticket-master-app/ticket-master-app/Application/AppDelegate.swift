//
//  AppDelegate.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

       var rootView: HomeView = UIStoryboard.init(name: "HomeStoryboard", bundle: .main).instantiateViewController(withIdentifier: "HomeView") as! HomeView
        
        window?.rootViewController = rootView
        
        return true
    }


}

