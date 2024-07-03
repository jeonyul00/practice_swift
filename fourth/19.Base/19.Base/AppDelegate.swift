//
//  AppDelegate.swift
//  19.Base
//
//  Created by 전율 on 7/3/24.
//

import UIKit

// @main: 이 프로젝트의 최초실행
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // didFinishLaunchingWithOptions: 가장 먼저 실행
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 앱이 실행하자마자 해야하는 값들 => 스플래시, 등등
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
                
        
    }
}

