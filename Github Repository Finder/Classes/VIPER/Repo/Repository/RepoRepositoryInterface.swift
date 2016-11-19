//
//  RepoRepositoryInterface.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

protocol RepoRepositoryInterface: class {

    func requestContributors(repoName:String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureHTTPCompletionBlock)
    func requestIssues(repoName:String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureHTTPCompletionBlock)

}
