//
//  AppDelegate.swift
//  Graphos
//
//  Created by Leandro Sousa on 23/12/19.
//  Copyright © 2019 Leandro Sousa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		PersistenceManager.instance.preparePlistForUse(.gameData)
		PersistenceManager.instance.preparePlistForUse(.gameDefinitions)
	}
}
