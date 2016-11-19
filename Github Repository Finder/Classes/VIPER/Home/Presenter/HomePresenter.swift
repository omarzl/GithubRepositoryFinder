//
//  HomePresenter.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {
    
    // MARK: - Properties
    
    weak var homeUserInterface: HomeViewController?
    var interactor: HomeInteractorInput?
    var routing: HomeRouting?
    var repositories = [Repository]()
    
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    
    func updateUserInterfaceWithRepositories(repositories: [Repository]) {
        self.repositories=repositories
        homeUserInterface?.reloadView()
    }
    
}

// MARK: - HomeInterface

extension HomePresenter: HomeInterface {
    
    func setContentToView(view: HomeCellProtocol, indexPath: IndexPath) {
        let repository=repositories[indexPath.row]
        view.set(title: repository.name)
    }
    
    func getRepositoriesForString(name: String) {
        interactor?.getRepositories(query: name)
    }
    
    // MARK: - Set interface properties methods.
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRepositories() -> Int {
        return repositories.count
    }
    
}
