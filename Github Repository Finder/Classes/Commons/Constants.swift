//
//  Constants.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class Constants {

    /**
     *  Urls
     */
    struct Urls {
        
        private static let kEndPointApi: String = "https://api.github.com/"
        
        private static let kGetSearch: String = "search/"
        private static let kGetSearchRepositories: String = "repositories"
        
        static let kGetSearchRepositoriesURL: String = Constants.Urls.kEndPointApi + Constants.Urls.kGetSearch + Constants.Urls.kGetSearchRepositories
    }

}
