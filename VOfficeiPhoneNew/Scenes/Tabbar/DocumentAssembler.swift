//
//  DocumentAssembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import UIKit
import Reusable

protocol DocumentAssembler {
    func resolve(navigationController: UINavigationController) -> DocumentViewController
    func resolve(navigationController: UINavigationController) -> DocumentViewModel
    func resolve(navigationController: UINavigationController) -> DocumentNavigatorType
    func resolve() -> DocumentUseCaseType
}

extension DocumentAssembler {
    func resolve(navigationController: UINavigationController) -> DocumentViewController {
        let vc = DocumentViewController()
        let vm: DocumentViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> DocumentViewModel {
        return DocumentViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension DocumentAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> DocumentNavigatorType {
        return DocumentNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> DocumentUseCaseType {
        return DocumentUseCase()
    }
}
