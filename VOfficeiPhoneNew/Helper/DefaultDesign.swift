//
//  DefaultDesign.swift
//  Life
//
//  Created by Duc Minh Nguyen on 8/19/21.
//

import UIKit

struct Design {
    var font: UIFont
    var color: UIColor
    var alignment: NSTextAlignment
}

extension UILabel {
    func load(design: Design) {
        textColor = design.color
        font = design.font
        textAlignment = design.alignment
    }
}

extension Design {
    struct DefaultFont {
        static let gigantic      = Fonts.shared.defaultHelveticaNeueFont(ofSize: 64)
        static let header        = Fonts.shared.defaultHelveticaNeueFont(ofSize: 32)
        static let subheader     = Fonts.shared.defaultHelveticaNeueFont(ofSize: 24)
        static let title         = Fonts.shared.defaultHelveticaNeueFont(ofSize: 16)
        static let titleBold     = Fonts.shared.defaultHelveticaNeueBoldFont(ofSize: 16)
        static let titleItalic   = Fonts.shared.defaultHelveticaNeueLightItalicFont(ofSize: 16)
        static let primary       = Fonts.shared.defaultHelveticaNeueFont(ofSize: 14)
        static let primaryBold   = Fonts.shared.defaultHelveticaNeueBoldFont(ofSize: 14)
        static let primaryItalic = Fonts.shared.defaultHelveticaNeueLightItalicFont(ofSize: 14)
        static let secondary       = Fonts.shared.defaultHelveticaNeueFont(ofSize: 13)
        static let secondaryBold   = Fonts.shared.defaultHelveticaNeueBoldFont(ofSize: 13)
        static let secondaryItalic = Fonts.shared.defaultHelveticaNeueLightItalicFont(ofSize: 13)
    }

    public static let hint = Design(font: DefaultFont.secondary, color: .lightText, alignment: .center)
    
    // Document
    public static let documentTitle = Design(font: DefaultFont.titleBold, color: LAsset.text.color, alignment: .left)
    public static let documentWarningTitle = Design(font: DefaultFont.primary, color: LAsset.text.color, alignment: .left)
    public static let documentWarningContent = Design(font: DefaultFont.primary, color: .red, alignment: .left)
    public static let documentTime = Design(font: DefaultFont.primaryItalic, color: LAsset.text.color, alignment: .left)
}
