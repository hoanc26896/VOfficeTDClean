//
//  MainNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit

protocol MainNavigatorType {
    func toReview() -> ReviewViewController
}

struct MainNavigator: MainNavigatorType {
  
    
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toReview() -> ReviewViewController {
        let vc: ReviewViewController = assembler.resolve(navigationController: navigationController)
        return vc
    }
}

