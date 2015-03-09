//
//  AppDelegate.swift
//  SliderDemo
//
//  Created by 新闻 on 14-12-12.
//  Copyright (c) 2014年 Adways. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    var drawerController:MMDrawerController = MMDrawerController()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        var centerViewController = MainViewController()
        var leftViewController = LeftViewController()
        var rightViewCotroller = RightViewController()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var centerNavController = storyboard.instantiateInitialViewController() as UITabBarController
        
       // var leftNAvController = UINavigationController(rootViewController: leftViewController)
       // var rightNAvController = UINavigationController(rootViewController: rightViewCotroller)
        
        var leftStoryboard = UIStoryboard(name: "Left", bundle: nil)
        var leftNAvController = leftStoryboard.instantiateViewControllerWithIdentifier("LeftMain") as UINavigationController
        
        var rightStoryboard = UIStoryboard(name: "Right", bundle: nil)
        var rightNAvController = rightStoryboard.instantiateViewControllerWithIdentifier("RightMain") as UINavigationController

         drawerController = MMDrawerController(centerViewController: centerNavController, leftDrawerViewController: leftNAvController, rightDrawerViewController: rightNAvController)
         drawerController.showsShadow = false
        
         drawerController.restorationIdentifier = "MMDrawer"
         drawerController.maximumRightDrawerWidth = 200
         drawerController.maximumLeftDrawerWidth = 200
        
        drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureMode(5)
        drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureMode(8)
        
 
        self.window?.rootViewController = drawerController
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [AnyObject], coder: NSCoder) -> UIViewController? {
        
        var key : String = identifierComponents.last as  String
        if key == "MMDrawer"
        {
            return self.window?.rootViewController
        }else
        
        {
            return nil
        }
        
    }


}

