//
//  Owner.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit
import ObjectMapper

class Owner: Mappable {

    var name=""
    var userImage=""
    var contributions=0
    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        name <- map["login"]
        userImage <- map["avatar_url"]
        contributions <- map["contributions"]
    }
    
}
