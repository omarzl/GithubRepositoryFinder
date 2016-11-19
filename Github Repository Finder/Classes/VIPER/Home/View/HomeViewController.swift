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
    
    fileprivate lazy var tableView : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource=self
        tableView.delegate=self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.cellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60.0
        tableView.backgroundColor=Constants.Color.clear
        
        return tableView
    }()
    
    fileprivate lazy var wavesImageView : UIImageView = {
        
        let wavesImageView = LazyViews.defaultImageView()
        wavesImageView.contentMode = .scaleAspectFit
        wavesImageView.image=#imageLiteral(resourceName: "waves")
        wavesImageView.alpha=0.2
        
        return wavesImageView
    }()
    
    fileprivate lazy var searchBar : UISearchBar = {
       
        let searchBar=UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints=false
        searchBar.delegate=self
        
        return searchBar
    }()
    
    var wavesLeftConstraint:NSLayoutConstraint!
    var wavesImageWidth:CGFloat=0
    
    var presenter: HomeInterface!
    
    // MARK: - View management
    
    /**
     Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title="Github Rep Finder"
        configureView()
        
        let wavesImage=#imageLiteral(resourceName: "waves")
        wavesImageWidth=wavesImage.size.width-UIScreen.main.bounds.width
    }
    
    /**
     Configures the view.
     */
    func configureView() {
        
        view.backgroundColor=Constants.Color.white
        view.addSubview(searchBar)
        view.addSubview(wavesImageView)
        view.addSubview(tableView)
        
        // Constraints
        
        let metrics = ["wavesHeight":231]
        let views : [String : Any] = ["searchBar":searchBar,"wavesImageView":wavesImageView,"tableView" : tableView]
     
        wavesLeftConstraint=NSLayoutConstraint(item: wavesImageView,
                                               attribute: .left,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .left,
                                               multiplier: 1.0,
                                               constant: 0)
        
        view.addConstraint(wavesLeftConstraint)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "H:|[searchBar]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "H:|[tableView]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:|[searchBar][tableView]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
            "V:[wavesImageView(wavesHeight)]|",
                                                           options: [],
                                                           metrics: metrics,
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
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        cell.delegate=self
        
        presenter?.setContentToView(view: cell, indexPath: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    /**
     Tells the delegate that the specified row is now selected.
     
     - parameter tableView: A table-view object informing the delegate about the new row selection.
     - parameter indexPath: An index path locating the new selected row in tableView.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectViewAtIndexPath(indexPath: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height > 0 && scrollView.contentOffset.y>0{
            let percentage=CGFloat(scrollView.contentOffset.y/scrollView.contentSize.height)
            var constant=wavesImageWidth*percentage*(-1)
            if constant > wavesImageWidth{
                constant=wavesImageWidth
            }
            wavesLeftConstraint.constant=constant
            wavesImageView.setNeedsUpdateConstraints()
            wavesImageView.updateConstraintsIfNeeded()
        }
    }
    
}

// MARK: - HomeCellDelegate

extension HomeViewController:HomeCellDelegate{
    func didPressedButton(cell:UITableViewCell) {
        if let indexPath=tableView.indexPath(for: cell){
            presenter.didPressedButtonAtIndexPath(indexPath: indexPath)
        }
    }
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter!.getRepositoriesForString(name: searchText)
    }
}


