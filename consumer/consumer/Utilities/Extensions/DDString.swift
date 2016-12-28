//
//  DDString.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 12/27/16.
//  Copyright © 2016 Door Dash. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func dropFirst(_ n: Int = 1) -> String {
        return String(characters.dropFirst(n))
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                substring(with: substringFrom..<substringTo)
            }
        }
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
    func navTitle(color: UIColor = UIColor.defaultColor)-> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self)
        
        attributedString.addAttribute(NSFontAttributeName, value: UIFont.appBoldFont(size: 20.0), range: NSRange(location: 0, length: self.length))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: self.length))
        
        return attributedString
    }
    
    func attributedStringFromHTML(completionBlock:@escaping (NSAttributedString?) ->()) {
        guard let data = data(using: String.Encoding.utf8) else {
            print("Unable to decode data from html string: \(self)")
            return completionBlock(nil)
        }
        
        let options : [String: Any] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                       NSCharacterEncodingDocumentAttribute: NSNumber(value:String.Encoding.utf8.rawValue)]
        
        if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            completionBlock(attributedString)
        } else {
            print("Unable to create attributed string from html string: \(self)")
            completionBlock(nil)
        }
    }
}

extension NSMutableAttributedString {
    
    convenience init(string: String, lineSpacing: CGFloat = 5.0, aligntment: NSTextAlignment = .center) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = aligntment
        
        let attrsDict : [String: AnyObject] =  [NSParagraphStyleAttributeName : paragraphStyle]
        
        self.init(string: string, attributes: attrsDict)
    }
}
