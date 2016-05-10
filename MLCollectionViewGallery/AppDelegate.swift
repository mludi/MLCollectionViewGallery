//
//  AppDelegate.swift
//  MLCollectionViewGallery
//
//  Created by Matthias Ludwig on 10/05/16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window?.rootViewController = ImagesViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
