//
//  HomeViewController.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource=self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.cellIdentifier)
        
        return tableView
    }()
    
    var presenter: HomeInterface!
    
    // MARK: - View management
    
    /**
     Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title="Github Rep Finder"
        configureView()
        presenter!.getRepositoriesForString(name: "swift")
        
    }
    
    /**
     Configures the view.
     */
    func configureView() {
        
        view.addSubview(tableView)
        
        // Constraints
        
        let views = ["tableView" : tableView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|",
                            options: [],
                            metrics: nil,
                            views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|",
                            options: [],
                            metrics: nil,
                            views: views))
    }
    
    /**
     Reloads the view.
     */
    func reloadView() {
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource

extension HomeViewController:UITableViewDataSource{
    
    /**
     Tells the data source to return the number of rows in a given section of a table view.
     
     - parameter tableView: The table-view object requesting this information.
     - parameter section:   An index number identifying a section in tableView.
     
     - returns: The number of rows in section.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRepositories()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    /**
     Asks the data source for a cell to insert in a particular location of the table view.
     
     - parameter tableView: A table-view object requesting the cell.
     - parameter indexPath: An index path locating a row in tableView.
     
     - returns: An object inheriting from UITableViewCell that the table view can use for the specified row.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.cellIdentifier) as! HomeCell
        
        presenter?.setContentToView(view: cell, indexPath: indexPath)
        
        return cell
    }
}

