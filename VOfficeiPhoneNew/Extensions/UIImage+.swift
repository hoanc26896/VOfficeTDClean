//
//  UIImage+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/17/21.
//

import UIKit

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    func resize(width: CGFloat) -> UIImage {
        return resize(to: CGSize(width: width, height: width / (size.width / size.height)))
    }
    func resize(height: CGFloat) -> UIImage {
        return resize(to: CGSize(width: height * (size.width / size.height), height: height))
    }
}
