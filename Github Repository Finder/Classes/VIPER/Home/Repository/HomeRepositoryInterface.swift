//
//  HomeRepositoryInterface.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import Foundation

typealias SuccessCompletionBlock = (_ items: [AnyObject]?) -> ()
typealias SuccessWithObjectCompletionBlock = (_ item: AnyObject?) -> ()
typealias FailureHTTPCompletionBlock = (_ response: HTTPURLResponse?, _ error: Error?,_ userInfo:AnyObject?) -> ()

protocol HomeRepositoryInterface:class {

    func requestRepositories(query:String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureHTTPCompletionBlock)

}
