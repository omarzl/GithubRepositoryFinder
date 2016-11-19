//
//  Constants.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

/**
 *  Blocks
 */

typealias SuccessCompletionBlock = (_ items: [AnyObject]?) -> ()
typealias SuccessWithObjectCompletionBlock = (_ item: AnyObject?) -> ()
typealias FailureHTTPCompletionBlock = (_ response: HTTPURLResponse?, _ error: Error?,_ userInfo:AnyObject?) -> ()

class Constants {

    /**
     *  Urls
     */
    struct Urls {
        
        private static let kEndPointApi: String = "https://api.github.com/"
        
        private static let kGetSearch: String = "search/"
        private static let kGetSearchRepositories: String = "repositories"
        private static let kGetRepository: String = Constants.Key.fullname+"/"
        private static let kGetContributors: String = "contributors"
        private static let kGetIssues: String = "issues"
        
        static let kGetSearchRepositoriesURL: String = Constants.Urls.kEndPointApi + Constants.Urls.kGetSearch + Constants.Urls.kGetSearchRepositories
        static let kGetContributorsURL: String = Constants.Urls.kEndPointApi + Constants.Urls.kGetRepository + Constants.Urls.kGetContributors
        static let kGetIssuesURL: String = Constants.Urls.kEndPointApi + Constants.Urls.kGetRepository + Constants.Urls.kGetIssues
    }
    
    /**
     *  Colors
     */
    struct Color {
        
        static let black = UIColor.black
        static let blue = UIColor.blue
        static let white = UIColor.white
        static let clear = UIColor.clear
        static let grayLight = UIColor(red: 250.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        static let gray = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        static let turquoise = UIColor(red: 32/255.0, green: 189/255.0, blue: 157/255.0, alpha: 1.0)
        static let wetAsphalt = UIColor(red: 53/255.0, green: 73/255.0, blue: 93/255.0, alpha: 1.0)
        
    }
    
    
    /**
     *  Fonts
     */
    struct Font {
        
        static let regular = UIFont.systemFont(ofSize: 14)
        static let small = UIFont.systemFont(ofSize: 10)
        static let big = UIFont.systemFont(ofSize: 16)
        
        static let boldBig = UIFont.boldSystemFont(ofSize: 16)
    
    }
    
    /**
     *  Keys
     */
    struct Key {
        
        static let fullname = "{fullname}"
        
    }
}
