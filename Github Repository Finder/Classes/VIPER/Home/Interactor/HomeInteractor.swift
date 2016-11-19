//
//  HomeInteractor.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class HomeInteractor {
    
    // MARK: - Properties.
    
    weak var output: HomeInteractorOutput?
    var homeRepository: HomeRepositoryInterface?
    
}

// MARK: - HomeInteractorInput

extension HomeInteractor: HomeInteractorInput {
    
    func getRepositories(query:String) {
        homeRepository?.requestRepositories(query: query, success: { [weak self] (repositories) in
            if let repositories=repositories as? [Repository] {
                self?.output?.updateUserInterfaceWithRepositories(repositories: repositories,queryName: query)
            }
            }, failure: { (response, error, userInfo) in
                print(response)
        })
    }
    
}
