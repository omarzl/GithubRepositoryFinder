//
//  HomeCell.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeCell: UITableViewCell {

    var didSetupConstraints = false
    
    var delegate:HomeCellDelegate?
    
    // MARK: - View metrics.
    
    let imageViewHeight:CGFloat=50
    let imageViewWidth:CGFloat=50
    
    // MARK: - View objects.
    
    fileprivate lazy var titleImageView : UIImageView = {
        
        let titleImageView = LazyViews.defaultImageView()
        titleImageView.contentMode = .scaleAspectFill
        titleImageView.layer.cornerRadius=self.imageViewWidth/2.0
        titleImageView.layer.borderColor=Constants.Color.grayLight.cgColor
        titleImageView.layer.borderWidth=1.0
        titleImageView.clipsToBounds=true
        titleImageView.backgroundColor=Constants.Color.grayLight
        
        return titleImageView
    }()
    
    fileprivate lazy var titleLabel : UILabel = {
        
        let titleLabel = LazyViews.defaultLabel()
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines=0
        titleLabel.font=Constants.Font.boldBig
        titleLabel.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, for: .horizontal)
        
        return titleLabel
    }()
    
    fileprivate lazy var usernameLabel : UILabel = {
        
        let usernameLabel = LazyViews.defaultLabel()
        usernameLabel.textColor=Constants.Color.gray
        usernameLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        usernameLabel.textAlignment = .right
        
        return usernameLabel
    }()
    
    fileprivate lazy var descriptionLabel : UILabel = {
        
        let descriptionLabel = LazyViews.defaultLabel()
        descriptionLabel.numberOfLines=0
        
        return descriptionLabel
    }()
    
    fileprivate lazy var urlButton : UIButton = {
        
        let urlButton = LazyViews.defaultButton()
        urlButton.setTitleColor(Constants.Color.turquoise, for: .normal)
        urlButton.titleLabel?.font=Constants.Font.small
        urlButton.addTarget(self, action: #selector(HomeCell.didPressedButton), for: .touchUpInside)
        
        return urlButton
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
        backgroundColor=Constants.Color.clear
        contentView.addSubview(titleImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(urlButton)
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !didSetupConstraints {
            
            // Constraints.
            
            let metrics = ["margin" : 5,"padding":10, "imageViewHeight": imageViewHeight, "imageViewWidth": imageViewWidth]
            let views : [String : Any] = ["titleImageView" : titleImageView, "titleLabel" : titleLabel, "usernameLabel": usernameLabel, "descriptionLabel": descriptionLabel,"urlButton":urlButton]
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-padding-[usernameLabel]-margin-[titleImageView(imageViewWidth)]-padding-|",
                                                                    options: [],
                                                                    metrics: metrics,
                                                                    views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-padding-[titleLabel]-margin-[titleImageView]",
                                                                      options: [],
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-padding-[descriptionLabel]-padding-|",
                                                                      options: [],
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-padding-[urlButton]-padding-|",
                                                                      options: [],
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:
                "V:|-padding-[titleImageView(imageViewHeight)]-margin-[descriptionLabel]-margin-[urlButton]-padding-|",
                                                                      options: [],
                                                                      metrics: metrics,
                                                                      views: views))
            
            contentView.addConstraint(NSLayoutConstraint(item: titleImageView,
                                                         attribute: .centerY,
                                                         relatedBy: .equal,
                                                         toItem: titleLabel,
                                                         attribute: .centerY,
                                                         multiplier: 1.0,
                                                         constant: 0))
            
            contentView.addConstraint(NSLayoutConstraint(item: titleImageView,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: usernameLabel,
                                                         attribute: .top,
                                                         multiplier: 1.0,
                                                         constant: 0))

            
            didSetupConstraints=true
        }
    }

    
    func didPressedButton(){
        delegate?.didPressedButton(cell: self)
    }
}

// MARK: - HomeCellProtocol

extension HomeCell:HomeCellProtocol {
    func set(title: String) {
        titleLabel.text=title
    }
    func set(image: String) {
        titleImageView.image=nil
        if let url=URL(string: image){
            titleImageView.af_setImage(withURL: url)
        }
    }
    func set(username: String) {
        usernameLabel.text=username
    }
    func set(desc: String) {
        descriptionLabel.text=desc
    }
    func set(url: String) {
        urlButton.setTitle(url, for: .normal)
    }
}

// MARK: - Identifier

extension HomeCell {
    
    static var cellIdentifier: String {
        get {
            return "HomeCell"
        }
    }
}
