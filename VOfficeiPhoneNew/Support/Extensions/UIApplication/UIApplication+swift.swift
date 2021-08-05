//
//  UIApplication+swift.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/28/21.
//

import UIKit

extension UIApplication{
    static func topViewControllerInNavigationStack(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
          if let navigationController = controller as? UINavigationController {
               return topViewControllerInNavigationStack(controller: navigationController.visibleViewController)
          }
          if let tabController = controller as? UITabBarController {
              if let selected = tabController.selectedViewController {
                return topViewControllerInNavigationStack(controller: selected)
              }
          }
          if let presented = controller?.presentedViewController {
              return topViewControllerInNavigationStack(controller: presented)
          }
          return controller
      }
}
