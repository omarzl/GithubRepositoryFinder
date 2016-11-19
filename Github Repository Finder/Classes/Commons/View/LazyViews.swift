//
//  LazyViews.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class LazyViews {

    static func defaultImageView()->UIImageView{
        let imageView=UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }
    
    static func defaultLabel()->UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Font.regular
        label.textColor = Constants.Color.black
        label.textAlignment = .left
        return label
    }
    
    static func defaultButton()->UIButton{
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        return button
    }
}
