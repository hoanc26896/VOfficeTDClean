//
//  UIViewController+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func showError(message: String, okTitle: String = L10n.coreCommonClose, completion: (() -> Void)? = nil) {
        let ac = UIAlertController(title: L10n.coreCommonAlert,
                                   message: message,
                                   preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okTitle, style: .cancel) { _ in
            completion?()
        }
        
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
    
    func showError(title: String = L10n.coreCommonAlert, message: String, okTitle: String, cancelTitle:String, okCompletion: (() -> Void)? = nil,  cancelCompletion: (() -> Void)? = nil) {
        let ac = UIAlertController(title: L10n.coreCommonAlert,
                                   message: message,
                                   preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
            okCompletion?()
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            cancelCompletion?()
        }
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
    
    func showAutoCloseMessage(image: UIImage?,
                              title: String?,
                              message: String?,
                              interval: TimeInterval = 2,
                              completion: (() -> Void)? = nil) {
        if let image = image {
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.mode = .customView
            hud.customView = UIImageView(image: image)
            hud.label.text = title
            hud.detailsLabel.text = message
            
            DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
                MBProgressHUD.hide(for: self.view, animated: true)
                completion?()
            }
        } else {
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
                ac.dismiss(animated: true, completion: completion)
            }
            
            present(ac, animated: true, completion: nil)
        }
    }
    
}
