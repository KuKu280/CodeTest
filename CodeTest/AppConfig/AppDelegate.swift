//
//  AppDelegate.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppCoordinator.shared.coordinate(window: window)
        return true
    }

    
}

