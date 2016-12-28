//
//  DDColor.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func ColorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)-> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    open class var defaultColor: UIColor {
        
        return UIColor.ColorWith(red: 252.0, green: 66.0, blue: 97.0, alpha: 1.0)
    }
}
