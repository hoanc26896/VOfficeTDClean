//
//  UIAlertController+swift.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/28/21.
//

import UIKit

extension UIAlertController {
    static func dismissPresentedAlertViewController() {
         let viewController = UIApplication.topViewControllerInNavigationStack()
         guard let isKindOf = viewController?.isKind(of:
         UIAlertController.classForCoder()), isKindOf else {
             return
         }
        viewController?.dismiss(animated: false, completion: nil)
    }
}
