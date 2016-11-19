//
//  HomeRepository.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class HomeRepository {
    
    // MARK: - Properties.
    
    fileprivate let searchRepositoriesPath = Constants.Urls.kGetSearchRepositoriesURL
    fileprivate var searchTerm=""
}

// MARK: - HomeRepositoryInterface

extension HomeRepository: HomeRepositoryInterface {
  
    func requestRepositories(query: String, success: @escaping ([AnyObject]?) -> (), failure: @escaping (HTTPURLResponse?, Error?, AnyObject?) -> ()) {
        
        searchTerm=query
        let requestPath=searchRepositoriesPath+"?q=\(query)"
        //let requestPath=searchRepositoriesPath+"?q=\(query)+language:\(query)"
        
        Alamofire.request(requestPath).responseObject { (response:DataResponse<GithubSearch>) in
            if response.result.isSuccess, let githubSearch=response.result.value, self.searchTerm==query{
                success(githubSearch.repositories)
            }else{
                failure(response.response, response.result.error, nil)
            }
        }
        
    }
    
}
