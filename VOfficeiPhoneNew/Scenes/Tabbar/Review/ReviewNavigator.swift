//
//  ReviewNavigator.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/1/21.
//

import UIKit

protocol ReviewNavigatorType {
    
}

struct ReviewNavigator: ReviewNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
