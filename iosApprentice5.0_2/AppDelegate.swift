//
//  AppDelegate.swift
//  iosApprentice5.0_2
//
//  Created by Chee Hung Chan on 15/3/2018.
//  Copyright © 2018年 Chee Hung Chan. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    let dataModel = DataModel()

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Received local notification in-app \(notification)")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = window!.rootViewController as! UINavigationController
        let controller = navigationController.viewControllers[0] as! AllListViewController
        controller.dataModel = dataModel
        // Add local notifications
        let center  = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound]) {
//            granted, error in
//            if granted {
//                print("Houston, we have permission")
//            } else {
//                print("Permission denied")
//            }
//        }
        center.delegate = self
//        let content = UNMutableNotificationContent()
//        content.title = "Have you completed a treatment today?"
//        content.body = "Log it down and track your progress now!"
//        content.sound = UNNotificationSound.default()
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
//                                                        repeats: false)
//        let request = UNNotificationRequest(identifier: "AS2020Notification", content: content, trigger: trigger)
//        center.add(request)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        saveData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveData()
    }
    func saveData() {
//        let navigationController = window!.rootViewController as! UINavigationController
//        let controller = navigationController.viewControllers[0] as! AllListViewController
//        controller.saveChecklists()
        dataModel.saveChecklists()
    }

}

