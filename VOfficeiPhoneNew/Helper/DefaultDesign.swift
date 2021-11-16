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
        static let gigantic     = Fonts.shared.defaultFont(ofSize: 64, weight: .heavy)
        static let header       = Fonts.shared.defaultFont(ofSize: 32, weight: .heavy)
        static let subheader    = Fonts.shared.defaultFont(ofSize: 24, weight: .bold)
        static let title        = Fonts.shared.defaultFont(ofSize: 17, weight: .semibold)
        static let primary      = Fonts.shared.defaultFont(ofSize: 15, weight: .regular)
        static let secondary    = Fonts.shared.defaultFont(ofSize: 13, weight: .light)
    }

    public static let hint = Design(font: DefaultFont.secondary, color: .lightText, alignment: .center)
}
