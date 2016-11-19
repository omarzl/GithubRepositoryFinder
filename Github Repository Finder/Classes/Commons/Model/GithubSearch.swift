//
//  GithubSearch.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit
import ObjectMapper

class GithubSearch: Mappable {

    var repositories = [Repository]()

    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        repositories <- map["items"]
    }
    
}
