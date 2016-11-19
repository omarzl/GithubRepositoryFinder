//
//  RepoRepository.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RepoRepository {
    
    // MARK: - Properties.
 
    fileprivate let getContributorsPath = Constants.Urls.kGetContributorsURL
    fileprivate let getIssuesPath = Constants.Urls.kGetIssuesURL
}

// MARK: - RepoRepositoryInterface

extension HomeRepository: RepoRepositoryInterface {
 
    
}
