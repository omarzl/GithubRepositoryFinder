//
//  HomeRouting.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class HomeRouting {
    
    // MARK: - Properties.
    
    var rootRouting: RootRouting?
    private weak var presenter: HomePresenter?
    private weak var navigationController:NavigationController?
    
    // MARK: - Routing management.
    
    func presentHomeViewController() {
        
        let homeViewController = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let repository = HomeRepository()
        
        homeViewController.presenter = presenter
        
        presenter.routing = self
        presenter.homeUserInterface = homeViewController
        presenter.interactor = interactor
        
        interactor.homeRepository = repository
        interactor.output = presenter
        
        self.presenter = presenter
        
        navigationController=NavigationController(rootViewController: homeViewController)
        rootRouting?.showRootViewController(viewController: navigationController!)
    }
    
    func presentRepositoryDetails(repository:Repository){
        if let navigationController=navigationController{
            let repoRouting=RepoRouting()
            repoRouting.presentRepoViewControllerFromNavigationController(repo: repository, navigationController: navigationController)
        }
    }
    
}
