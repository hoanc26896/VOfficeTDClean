//
//  DocumentPageAssembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit
import Reusable

protocol DocumentPageAssembler {
    func resolve(navigationController: UINavigationController, tabbarItem: TabBarItem) -> DocumentPageViewController
    func resolve(navigationController: UINavigationController, tabbarItem: TabBarItem) -> DocumentPageViewModel
    func resolve(navigationController: UINavigationController) -> DocumentPageNavigatorType
    func resolve() -> DocumentPageUseCaseType
}

extension DocumentPageAssembler {
    func resolve(navigationController: UINavigationController, tabbarItem: TabBarItem) -> DocumentPageViewController {
        let vc = DocumentPageViewController()
        let vm: DocumentPageViewModel = resolve(navigationController: navigationController, tabbarItem: tabbarItem)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController, tabbarItem: TabBarItem) -> DocumentPageViewModel {
        return DocumentPageViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve(),
            tabbarItem: tabbarItem
        )
    }
}

extension DocumentPageAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> DocumentPageNavigatorType {
        return DocumentPageNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> DocumentPageUseCaseType {
        return DocumentPageUseCase()
    }
}
