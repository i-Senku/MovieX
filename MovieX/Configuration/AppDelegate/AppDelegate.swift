//
//  AppDelegate.swift
//  MovieX
//
//  Created by Ercan Garip on 24.08.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let shared = UIApplication.shared.delegate as! AppDelegate
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureFirebase()
        configureFCM(application)
        
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        window?.makeKeyAndVisible()
        app.router.window = window
        app.router.start()
        return true
    }
}
