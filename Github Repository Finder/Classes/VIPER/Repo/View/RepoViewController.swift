//
//  RepoViewController.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {

    // MARK: - Properties
    
    fileprivate lazy var tableView : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource=self
        tableView.register(InfoUserCell.self, forCellReuseIdentifier: InfoUserCell.cellIdentifier)
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.cellIdentifier)
        tableView.register(DetailsCell.self, forCellReuseIdentifier: DetailsCell.cellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60.0
        
        return tableView
    }()

    
    var presenter:RepoPresenter!
    
    // MARK: - View management
    
    /**
     Called after the controller's view is loaded into memory.
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        title=presenter!.titleForView()
        presenter!.requestDetails()
    }

    /**
     Configures the view.
     */
    func configureView() {
        
        view.backgroundColor=Constants.Color.white
        view.addSubview(tableView)
        
        // Constraints
        
        let views : [String : Any] = ["tableView" : tableView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "H:|[tableView]|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:|[tableView]|",
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

extension RepoViewController:UITableViewDataSource{
    
    /**
     Tells the data source to return the number of rows in a given section of a table view.
     
     - parameter tableView: The table-view object requesting this information.
     - parameter section:   An index number identifying a section in tableView.
     
     - returns: The number of rows in section.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsAtSection(index: section)
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
       
        var cell:UITableViewCell!
        let section=indexPath.section
        if section == 0{
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: DetailsCell.cellIdentifier, for: indexPath) as! DetailsCell
            presenter.setContentToView(view: detailsCell, indexPath: indexPath)
            cell=detailsCell
        }else if section == 1{
            let infoUserCell = tableView.dequeueReusableCell(withIdentifier: InfoUserCell.cellIdentifier, for: indexPath) as! InfoUserCell
            presenter.setContentToView(view: infoUserCell, indexPath: indexPath)
            cell=infoUserCell            
        }else if section == 2{
            let userCell = tableView.dequeueReusableCell(withIdentifier: UserCell.cellIdentifier, for: indexPath) as! UserCell
            presenter.setContentToView(view: userCell, indexPath: indexPath)
            cell=userCell
        }
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        cell.selectionStyle = .none
        //presenter?.setContentToView(view: cell, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.titleForSection(index: section)
    }
}

