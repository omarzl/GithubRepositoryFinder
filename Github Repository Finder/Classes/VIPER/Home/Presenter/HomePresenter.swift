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
    
    // MARK: - Set interface properties methods.
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRepositories() -> Int {
        return repositories.count
    }
    
    func setContentToView(view: HomeCellProtocol, indexPath: IndexPath) {
        let repository=repositories[indexPath.row]
        let username=repository.owner?.name ?? ""
        let userImage=repository.owner?.userImage ?? ""
        view.set(title: repository.name)
        view.set(desc: repository.desc)
        view.set(url: repository.url)
        view.set(username: username)
        view.set(image: userImage)
    }
    
    // MARK: - Search
    
    func getRepositoriesForString(name: String) {
        repositories.removeAll()
        if name != ""{
            interactor?.getRepositories(query: name)
        }else{
            homeUserInterface?.reloadView()
        }
    }
    
    // MARK: - Selection methods
    
    func didPressedButtonAtIndexPath(indexPath: IndexPath) {
        let repository=repositories[indexPath.row]
        if let url=URL(string: repository.url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func didSelectViewAtIndexPath(indexPath: IndexPath) {
        
    }
    

    
}
