//
//  RepoInteractorIO.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//


import Foundation

protocol RepoInteractorInput: class {
    
    func getIssues(repository:Repository)
    func getContributors(repository:Repository)
    
}

protocol RepoInteractorOutput: class {
    
    func updateInterface()
    
}
