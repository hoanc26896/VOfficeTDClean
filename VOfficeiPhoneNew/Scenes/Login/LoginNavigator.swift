//
//  LoginNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit

protocol LoginNavigatorType {
    func toMain()
}

struct LoginNavigator: LoginNavigatorType {
    func toMain() {
        let vc: MainViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
