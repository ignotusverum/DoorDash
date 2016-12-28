//
//  DDFont.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func appRegularFont(size fontsize:CGFloat) -> UIFont {
        
        return UIFont(name: "Atrian1", size: fontsize)!
    }
    
    class func appBoldFont(size fontsize:CGFloat) -> UIFont {
        
        return UIFont(name: "Atrian3", size: fontsize)!
    }
}
