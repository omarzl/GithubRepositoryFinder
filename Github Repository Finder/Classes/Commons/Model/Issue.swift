//
//  Issue.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit
import ObjectMapper

class Issue: Mappable {

    var title=""
    var body=""
    var owner:Owner?
    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        title <- map["title"]
        owner <- map["user"]
        body <- map["body"]
    }
    
}
