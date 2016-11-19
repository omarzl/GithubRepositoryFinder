//
//  RepoInteractor.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RepoInteractor {
    
    // MARK: - Properties.
    
    weak var output: RepoInteractorOutput?
    var repoRepository: RepoRepositoryInterface?
    
}

// MARK: - RepoInteractorInput

extension RepoInteractor: RepoInteractorInput {
    
    
}
