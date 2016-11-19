//
//  HomeInterface.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

protocol HomeInterface:class {

    func numberOfSections() -> Int
    func numberOfRepositories() -> Int
    func getRepositoriesForString(name:String)
    func setContentToView(view: HomeCellProtocol, indexPath: IndexPath)
    func didPressedButtonAtIndexPath(indexPath:IndexPath)
    func didSelectViewAtIndexPath(indexPath:IndexPath)
    
}
