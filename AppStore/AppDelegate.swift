//
//  AppDelegate.swift
//  AppStore
//
//  Created by 구희정 on 2022/06/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //피트니스 App처럼 탭바가 반투명으로 변경 될 수 있도록 알아보기 -> 기존 탭바 자체가 반투명으로 변경이 됨.
        //IOS 15버전 이상일 경우 탭바 배경색 변경
        if #available(iOS 15.0, *) {
//            let appearance = UITabBarAppearance()
//            let tabBar = UITabBar()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = UIColor.white
//            tabBar.standardAppearance = appearance;
//
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }



}

