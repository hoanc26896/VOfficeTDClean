//
//  ReviewAssembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/1/21.
//

import UIKit
import Reusable

protocol ReviewAssembler {
    func resolve(navigationController: UINavigationController) -> ReviewViewController
    func resolve(navigationController: UINavigationController) -> ReviewViewModel
    func resolve(navigationController: UINavigationController) -> ReviewNavigatorType
    func resolve() -> ReviewUseCaseType
}

extension ReviewAssembler {
    func resolve(navigationController: UINavigationController) -> ReviewViewController {
        let vc = ReviewViewController.instantiate()
        let vm: ReviewViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> ReviewViewModel {
        return ReviewViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension ReviewAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> ReviewNavigatorType {
        return ReviewNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> ReviewUseCaseType {
        return ReviewUseCase()
    }
}
