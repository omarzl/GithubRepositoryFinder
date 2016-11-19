//
//  InfoCell.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    var didSetupConstraints = false
    
    // MARK: - View metrics.
    
    let imageViewHeight:CGFloat=50
    let imageViewWidth:CGFloat=50
    
    // MARK: - View objects.
    
    fileprivate lazy var userImageView : UIImageView = {
        
        let userImageView = LazyViews.defaultImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius=self.imageViewWidth/2.0
        userImageView.layer.borderColor=Constants.Color.grayLight.cgColor
        userImageView.layer.borderWidth=2.0
        userImageView.clipsToBounds=true
        userImageView.backgroundColor=Constants.Color.grayLight
        
        return userImageView
    }()
    
    fileprivate lazy var usernameLabel : UILabel = {
        
        let usernameLabel = LazyViews.defaultLabel()
        usernameLabel.textColor=Constants.Color.black
        usernameLabel.numberOfLines=0
        
        return usernameLabel
    }()
    
    
    // MARK: - Instance initialization.
    
    /**
     Initializes and returns a newly allocated view object with the specified frame rectangle.
     
     - parameter frame: The frame rectangle for the view, measured in points.
     
     - returns: An initialized view object.
     */
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializeView()
    }
    
    /**
     Returns an object initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     
     - returns: self, initialized using the data in decoder.
     */
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        
        initializeView()
    }
    
    /**
     Initializes the view.
     */
    func initializeView() {
        contentView.addSubview(userImageView)
        contentView.addSubview(usernameLabel)
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !didSetupConstraints {
            
            // Constraints.
            
            let metrics = ["margin" : 5,"padding":10, "imageViewHeight": imageViewHeight, "imageViewWidth": imageViewWidth]
            let views : [String : Any] = ["userImageView" : userImageView, "usernameLabel": usernameLabel]
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-padding-[userImageView(imageViewWidth)]-padding-[usernameLabel]-padding-|",
                                                                      options: .alignAllCenterY,
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "V:|-padding-[userImageView(imageViewHeight)]-padding-|",
                                                                      options: [],
                                                                      metrics: metrics,
                                                                      views: views))
            
            
            didSetupConstraints=true
        }
    }
}

// MARK: - UserCellProtocol

extension UserCell:UserCellProtocol {
    func set(username: String) {
        usernameLabel.text=username
    }
    func set(image: String) {
        userImageView.image=nil
        userImageView.isHidden = image == ""
        if let url=URL(string: image){
            userImageView.af_setImage(withURL: url)
        }
    }
}

// MARK: - Identifier

extension UserCell {
    
    static var cellIdentifier: String {
        get {
            return "UserCell"
        }
    }
}
