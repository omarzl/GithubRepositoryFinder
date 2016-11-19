//
//  HomeRepositoryInterface.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import Foundation

protocol HomeRepositoryInterface:class {

    func requestRepositories(query:String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureHTTPCompletionBlock)

}
