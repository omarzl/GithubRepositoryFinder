//
//  HomeCell.swift
//  Github Repository Finder
//
//  Created by kryteria on 18/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - HomeCellProtocol

extension HomeCell:HomeCellProtocol {
    func set(title: String) {
        textLabel?.text=title
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
