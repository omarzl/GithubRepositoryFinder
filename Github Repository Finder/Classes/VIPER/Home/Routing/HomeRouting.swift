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
        
        let navigationController=UINavigationController(rootViewController: homeViewController)
        rootRouting?.showRootViewController(viewController: navigationController)
    }
    
}
