//
//  DDMenuTableViewCell.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/28/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

class DDMenuTableViewCell: UITableViewCell {

    // Menu
    var menu: DDCategoryMenu? {
        didSet {
            
            // Safety check
            guard let menu = menu else { return }
            
            // Text label - Menu title
            self.textLabel?.text = menu.title
        }
    }
}
