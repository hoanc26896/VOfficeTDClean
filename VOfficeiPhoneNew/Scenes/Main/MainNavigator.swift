//
//  MainNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit

protocol MainNavigatorType {
    func toDocumentPage(tabbarItem: TabBarItem) -> DocumentPageViewController
}

struct MainNavigator: MainNavigatorType {
  
    
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toDocumentPage(tabbarItem: TabBarItem) -> DocumentPageViewController {
        let vc: DocumentPageViewController = assembler.resolve(navigationController: navigationController, tabbarItem: tabbarItem)
        return vc
    }
}

