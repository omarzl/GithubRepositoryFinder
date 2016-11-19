//
//  HomeInteractorIO.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import Foundation

protocol HomeInteractorInput: class {
    
    func getRepositories(query:String)

}

protocol HomeInteractorOutput: class {
    
    func updateUserInterfaceWithRepositories(repositories: [Repository],queryName:String)
    
}
