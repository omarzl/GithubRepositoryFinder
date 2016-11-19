//
//  NavigationController.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor=Constants.Color.wetAsphalt
        navigationBar.tintColor=Constants.Color.white
        navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:Constants.Color.white]
        navigationBar.isTranslucent=false

    }

}
