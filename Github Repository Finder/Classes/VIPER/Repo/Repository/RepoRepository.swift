//
//  RepoRepository.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit
import Alamofire

class RepoRepository {
    
    // MARK: - Properties.
 
    fileprivate let getContributorsPath = Constants.Urls.kGetContributorsURL
    fileprivate let getIssuesPath = Constants.Urls.kGetIssuesURL
}

// MARK: - RepoRepositoryInterface

extension RepoRepository: RepoRepositoryInterface {
 
    func requestIssues(repoName: String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureHTTPCompletionBlock) {

        let requestPath=getIssuesPath.replacingOccurrences(of: Constants.Key.fullname, with: repoName)
        
        Alamofire.request(requestPath).responseArray { (response:DataResponse<[Issue]>) in
            if response.result.isSuccess, let issues=response.result.value{
                success(issues)
            }else{
                failure(response.response, response.result.error, nil)
            }
        }
    }
    
    func requestContributors(repoName: String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureHTTPCompletionBlock) {
        
        let requestPath=getContributorsPath.replacingOccurrences(of: Constants.Key.fullname, with: repoName)
        
        Alamofire.request(requestPath).responseArray { (response:DataResponse<[Owner]>) in
            if response.result.isSuccess, let contributors=response.result.value{
                success(contributors)
            }else{
                failure(response.response, response.result.error, nil)
            }
        }
    }
    
}
