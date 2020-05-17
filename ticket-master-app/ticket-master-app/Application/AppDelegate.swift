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
        
        window?.rootViewController = buildInitialView()
        
        EventsDB.init()
        
        return true
    }
    
    func buildInitialView() -> UIViewController {
        
        let rootView: HomeView = UIStoryboard.init(name: "HomeStoryboard", bundle: .main).instantiateViewController(withIdentifier: "HomeView") as! HomeView
        
        let presenter: HomePresenter = HomePresenter()
        presenter.view = rootView
        
        (rootView as HomeViewProtocol).presenter = presenter
        
        return rootView
        
    }


}

