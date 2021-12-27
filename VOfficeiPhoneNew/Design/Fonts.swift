//
//  Fonts.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit

class Fonts {
    public static let shared = Fonts()
    
    public func defaultFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    public func defaultHelveticaNeueFont(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    
    public func defaultHelveticaNeueBoldFont(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    public func defaultHelveticaNeueLightItalicFont(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "HelveticaNeue-LightItalic", size: size)!
    }
}
