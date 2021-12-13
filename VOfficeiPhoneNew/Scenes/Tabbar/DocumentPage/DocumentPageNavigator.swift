//
//  DocumentPageNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit

protocol DocumentPageNavigatorType {
    func toDocument(pageView: PageView) -> DocumentViewController
}

struct DocumentPageNavigator: DocumentPageNavigatorType {
    func toDocument(pageView: PageView) -> DocumentViewController {
        return assembler.resolve(navigationController: navigationController, type: pageView)
    }
    
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
