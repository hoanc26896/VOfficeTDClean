//
//  LoginViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import MGArchitecture
import RxSwift
import RxCocoa
import Foundation

protocol LoginViewModelProtocol {
    func defaultLanguage() -> Int
    func filterLanguage(selectIndex: Int) -> Bool
    func mapLanguage(selectIndex: Int) -> String
    
}

struct LoginViewModel {
    let navigator: LoginNavigatorType
    let useCase: LoginUseCaseType
}

// MARK: - ViewModel
extension LoginViewModel: ViewModel {
    struct Input {
        let onLoad: Driver<Void>
        let onChangeLanguage: Driver<Int>
        let onChangeUser: Driver<String>
        let onChangePass: Driver<String>
        let onLogin: Driver<Void>
        
    }
    
    struct Output {
        @Property var selectedSegmentIndex: Int = 0
        @Property var messageInvalidUsername: String = ""
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        // Change Segment
        let defaultLanguage = input.onLoad.map { _ in
            self.defaultLanguage()
        }.asDriver()
        let changeLanguageTrigger = Driver.merge(defaultLanguage, input.onChangeLanguage)
        changeLanguageTrigger.filter(self.filterLanguage).map(self.mapLanguage).distinctUntilChanged().drive(onNext: self.useCase.changeLanguage).disposed(by: disposeBag)
        changeLanguageTrigger.drive(output.$selectedSegmentIndex).disposed(by: disposeBag)
        
        // Login
        let isEmptyUsername = input.onLogin.withLatestFrom(input.onChangeUser).filter { username in
            return username.isEmpty
        }.map { _ in
            "Nhap lai"
        }
        isEmptyUsername.drive(output.$messageInvalidUsername).disposed(by: disposeBag)
        
        let isEmptyPassword = input.onLogin.withLatestFrom(input.onChangePass).filter { password in
            return password.isEmpty
        }.map { _ in
            "Nhap lai"
        }
        isEmptyUsername.drive(output.$messageInvalidUsername).disposed(by: disposeBag)
        
        
        return output
    }
}

extension LoginViewModel: LoginViewModelProtocol{
    func defaultLanguage() -> Int {
        let lang = AppSettings.language
        return lang == "vi" ? 0 : 1
    }

   
    
    func mapLanguage(selectIndex: Int) -> String {
        return selectIndex == 0 ? "vi" : "en"
    }
    
    func filterLanguage(selectIndex: Int) -> Bool {
        let lang = AppSettings.language
        let newLang = selectIndex == 0 ? "vi" : "en"
        return lang != newLang
    }
    
    
    
}
