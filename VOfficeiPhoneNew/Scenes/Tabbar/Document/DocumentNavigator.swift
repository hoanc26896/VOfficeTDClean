//
//  DocumentNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import UIKit

protocol DocumentNavigatorType {
    
}

struct DocumentNavigator: DocumentNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
