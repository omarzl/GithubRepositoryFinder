//
//  RootRouting.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RootRouting {
    
    let window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }

    func showRootViewController(viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    func presentHomeController() {
        let menuRouting = HomeRouting()
        menuRouting.rootRouting = self
        menuRouting.presentHomeViewController()
    }
}
