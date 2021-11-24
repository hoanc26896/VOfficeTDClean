//
//  UINavigationBar+Ext.swift
//  Life
//
//  Created by Duc Minh Nguyen on 8/19/21.
//

import UIKit

public extension UINavigationController {
    func popViewControllerWithHandler(completion: @escaping (() -> Void)) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
    
    func addAutoDetectIndicator(animated: Bool = true) {
//        if presentingViewController?.presentedViewController == self {
//            let dismissIcon = LAsset.icClose.withTintColor(.gray, renderingMode: .alwaysOriginal)
//            topViewController?.navigationItem.leftBarButtonItem = .init(image: dismissIcon, style: .done,
//                                                                        target: self, action: #selector(dismissVC))
//        }
    }
    
    @objc func popVC() {
        popViewController(animated: false)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

extension UINavigationController {
    func clearNavigationBar(with color: UIColor = UIColor.white) {
        navigationBar.setBackgroundImage(UIImage(color: color), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}

extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
