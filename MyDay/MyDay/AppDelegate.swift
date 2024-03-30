//
//  AppDelegate.swift
//  MyDay
//
//  Created by Sebastian Mraz on 30/03/2024.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var flowController = FlowCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        flowController.window = window
        flowController.showRootView()
        
        window?.makeKeyAndVisible()
        return true
    }

}

final class FlowCoordinator {
    
    var window: UIWindow?
    
    func showRootView() {
        guard let window else { return }
        
        let swiftUIView = MyDayView()
        let hostingView = UIHostingController(rootView: swiftUIView)
        window.rootViewController = UINavigationController(rootViewController: hostingView)
    }
    
}


