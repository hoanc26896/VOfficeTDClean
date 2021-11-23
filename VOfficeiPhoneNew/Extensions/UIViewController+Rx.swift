//
//  UIViewController+Rx.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit
import MBProgressHUD
import RxSwift
import RxCocoa

extension Reactive where Base: BaseViewController {
    var error: Binder<Error> {
        return Binder(base) { viewController, error in
            guard let error = error as? CommonError else {
                viewController.showError(message: error.localizedDescription)
                return 
            }
            viewController.showError(message: error.getMessage())
        }
    }
    
    var isLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            if isLoading {
                let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
                hud.offset.y = -30
            } else {
                MBProgressHUD.hide(for: viewController.view, animated: true)
            }
        }
    }
}
