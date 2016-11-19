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
    
    func getIssues(repository: Repository) {
        repoRepository?.requestIssues(repoName: repository.fullname, success: { [weak self] (issues) in
            if let issues=issues as? [Issue]{
                repository.issues=issues
                self?.output?.updateInterface()
            }
            }, failure: { (response, error, userInfo) in
        })
    }
    
    func getContributors(repository: Repository) {
        repoRepository?.requestContributors(repoName: repository.fullname, success: { [weak self] (contributors) in
            if let contributors=contributors as? [Owner]{
                repository.contributors=contributors
                self?.output?.updateInterface()
            }
            }, failure: { (response, error, userInfo) in
        })
    }
    
}
