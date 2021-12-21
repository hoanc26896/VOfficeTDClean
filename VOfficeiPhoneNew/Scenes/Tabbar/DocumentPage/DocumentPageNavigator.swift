//
//  DocumentPageNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit

protocol DocumentPageNavigatorType {
    func toDocument(pageView: PageViewEnum) -> DocumentViewController
}

struct DocumentPageNavigator: DocumentPageNavigatorType {
    func toDocument(pageView: PageViewEnum) -> DocumentViewController {
        return assembler.resolve(navigationController: navigationController, type: pageView)
    }
    
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
