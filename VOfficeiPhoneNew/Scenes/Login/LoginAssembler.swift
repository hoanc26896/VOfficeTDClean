//
//  LoginAssembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit
import Reusable

protocol LoginAssembler {
    func resolve(navigationController: UINavigationController) -> LoginViewController
    func resolve(navigationController: UINavigationController) -> LoginViewModel
    func resolve(navigationController: UINavigationController) -> LoginNavigatorType
    func resolve() -> LoginUseCaseType
}

extension LoginAssembler {
    func resolve(navigationController: UINavigationController) -> LoginViewController {
        let vc = LoginViewController()
        let vm: LoginViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> LoginViewModel {
        return LoginViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension LoginAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> LoginNavigatorType {
        return LoginNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> LoginUseCaseType {
        return LoginUseCase(rsaGateway: resolve())
    }
}
