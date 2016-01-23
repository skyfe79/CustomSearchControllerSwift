//
//  AppDelegate.swift
//  CustomSearchController
//
//  Created by Julien Hoachuck on 8/19/15.
//  Copyright (c) 2015 Pandodroid. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UITextField.my_appearanceWhenContainedIn(UISearchBar.self).keyboardAppearance = .Dark
        UITextField.my_appearanceWhenContainedIn(UISearchBar.self).leftViewMode = .Never

        return true
    }

}

