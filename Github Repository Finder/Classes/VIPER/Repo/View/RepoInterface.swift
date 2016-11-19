//
//  RepoInterface.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

protocol RepoInterface:class {
    
    func titleForView()->String
    func requestDetails()
    func numberOfSections()->Int
    func numberOfRowsAtSection(index:Int)->Int
    func titleForSection(index:Int)->String
    func setContentToView(view: UserCellProtocol, indexPath: IndexPath)
    func setContentToView(view: InfoUserCellProtocol, indexPath: IndexPath)
    func setContentToView(view: DetailsCellProtocol, indexPath: IndexPath)
    
}
