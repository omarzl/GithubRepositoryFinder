//
//  RepoRouting.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RepoRouting {
    
    // MARK: - Properties.

    private weak var presenter: RepoPresenter?
    
    // MARK: - Routing management.
    
    func presentRepoViewControllerFromNavigationController(navigationController:NavigationController) {
        
        let repoViewController = RepoViewController()
        let presenter = RepoPresenter()
        let interactor = RepoInteractor()
        let repository = RepoRepository()
        
        repoViewController.presenter = presenter
        
        presenter.routing = self
        presenter.repoUserInterface = repoViewController
        presenter.interactor = interactor
        
        interactor.repoRepository = repository
        interactor.output = presenter
        
        self.presenter = presenter
        
        navigationController.pushViewController(repoViewController, animated: true)
    }
    
}
