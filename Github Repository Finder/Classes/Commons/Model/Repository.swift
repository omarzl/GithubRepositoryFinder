//
//  Repository.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit
import ObjectMapper

class Repository: Mappable {

    var name=""
    var desc=""
    var url=""
    var fullname=""
    var owner:Owner?
    var issues=[Issue]()
    var contributors=[Owner]()
    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        name <- map["name"]
        desc <- map["description"]
        url <- map["html_url"]
        fullname <- map["full_name"]
        owner <- map["owner"]
    }
}
