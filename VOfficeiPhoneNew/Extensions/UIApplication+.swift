//
//  UIApplication+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/30/21.
//

import Foundation
import UIKit

extension UIApplication{
    static func openUrl(urlStr:String){
        guard let url = URL(string: urlStr) else {
          return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
