//
//  RepoPresenter.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RepoPresenter: NSObject {

    // MARK: - Properties
    
    weak var repoUserInterface: RepoViewController?
    var interactor: RepoInteractorInput?
    var routing: RepoRouting?
    
    
}

// MARK: - RepoInteractorOutput

extension HomePresenter: RepoInteractorOutput {
    

    
}

// MARK: - RepoInterface

extension RepoPresenter: RepoInterface {
       
}
