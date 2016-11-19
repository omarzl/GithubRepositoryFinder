//
//  InfoUserCell.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class InfoUserCell: UITableViewCell {
    
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
        usernameLabel.textAlignment = .center
        usernameLabel.font=Constants.Font.small
        
        return usernameLabel
    }()
    
    fileprivate lazy var titleLabel : UILabel = {
        
        let titleLabel = LazyViews.defaultLabel()
        titleLabel.numberOfLines=0
        titleLabel.font=Constants.Font.boldBig
        titleLabel.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, for: .horizontal)
        
        return titleLabel
    }()
    
    fileprivate lazy var descriptionLabel : UILabel = {
        
        let descriptionLabel = LazyViews.defaultLabel()
        descriptionLabel.numberOfLines=0
        
        return descriptionLabel
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !didSetupConstraints {
            
            // Constraints.
            
            let metrics = ["margin" : 5,"padding":10, "imageViewHeight": imageViewHeight, "imageViewWidth": imageViewWidth]
            let views : [String : Any] = ["userImageView" : userImageView, "usernameLabel": usernameLabel,"titleLabel":titleLabel,"descriptionLabel":descriptionLabel]
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-padding-[userImageView(imageViewWidth)]-padding-[titleLabel]-padding-|",
                                                                      options: [],
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "V:|-padding-[userImageView(imageViewHeight)]-margin-[usernameLabel]-(>=padding)-|",
                                                                      options: .alignAllCenterX,
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "V:|-padding-[titleLabel]-margin-[descriptionLabel]-(>=padding)-|",
                                                                      options: .alignAllCenterX,
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: descriptionLabel,
                                                         attribute: .width,
                                                         multiplier: 1.0,
                                                         constant: 0))
            
            contentView.addConstraint(NSLayoutConstraint(item: userImageView,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: usernameLabel,
                                                         attribute: .width,
                                                         multiplier: 1.0,
                                                         constant: 0))
            
            
            didSetupConstraints=true
        }
    }
}

// MARK: - InfoUserCellProtocol

extension InfoUserCell:InfoUserCellProtocol {
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
    func set(title: String) {
        titleLabel.text=title
    }
    func set(desc: String) {
        descriptionLabel.text=desc
    }
}

// MARK: - Identifier

extension InfoUserCell {
    
    static var cellIdentifier: String {
        get {
            return "InfoUserCell"
        }
    }
}
