//
//  DDViewController.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit
import EZSwiftExtensions

extension UIViewController {
    
    // Title Setup
    func setTitle(_ titleText: String, color: UIColor = UIColor.defaultColor) {
        
        let label = UILabel()
        
        label.attributedText = titleText.navTitle()
        
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
    
    // Action
    @IBAction func backButtonPressed(_ sender: AnyObject?) {
        
        self.view.endEditing(true)
        
        if self.presentingViewController?.presentedViewController != nil {
            
            self.dismissVC(completion: nil)
        }
        else {
            self.popVC()
        }
    }
}
