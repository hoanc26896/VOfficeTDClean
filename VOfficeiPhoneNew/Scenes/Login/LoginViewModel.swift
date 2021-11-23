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
        @Property var messageInvalidError: String = ""
        @Property var messageError: String = ""
        @Property var isAllowLogin = true
        @Property var isLoading = false
        @Property var error: Error?
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        // Change Segment
        let defaultLanguage = input.onLoad.map { _ in
            self.defaultLanguage()
        }.asDriver()
        let changeLanguageTrigger = Driver.merge(defaultLanguage, input.onChangeLanguage)
            
        changeLanguageTrigger
            .filter(self.filterLanguage)
            .map(self.mapLanguage)
            .distinctUntilChanged()
            .drive(onNext: self.useCase.changeLanguage)
            .disposed(by: disposeBag)
        changeLanguageTrigger
            .drive(output.$selectedSegmentIndex)
            .disposed(by: disposeBag)
        
        // Login
        let errorTracker = ErrorTracker()
        errorTracker
            .drive(output.$error)
            .disposed(by: disposeBag)
        
        let activityIndicator = ActivityIndicator()
        let isLoading = activityIndicator.asDriver()
        isLoading
            .drive(output.$isLoading)
            .disposed(by: disposeBag)
        
        let usernameValidation = input.onLogin.withLatestFrom(input.onChangeUser)
            .map { $0 }
            .map(useCase.validateUserName(_:))
        
        let messageUserValidation = usernameValidation
            .map { $0.message }
            
        let passwordValidation = input.onLogin.withLatestFrom(input.onChangePass)
            .map { $0 }
            .map(useCase.validatePassword(_:))
        
        let messagePassValidation = passwordValidation
            .map { $0.message }

        Driver.merge(messageUserValidation, messagePassValidation)
            .filter{!$0.isEmpty}
            .drive(output.$messageInvalidError)
            .disposed(by: disposeBag)
        
        let validation = Driver.and(
            usernameValidation.map { $0.isValid },
            passwordValidation.map { $0.isValid }
        ).startWith(false)

        let isAllowLogin = Driver.merge(validation, isLoading)
        isAllowLogin.drive(output.$isAllowLogin).disposed(by: disposeBag)
        
        let onCallRSA = input.onLogin
            .withLatestFrom(isAllowLogin)
            .filter{$0}
            .flatMap({ _ -> Driver<RSAKey> in
                return self.useCase.postRSAKeyPublic().trackError(errorTracker).trackActivity(activityIndicator).asDriverOnErrorJustComplete()
            })
            .map({ rsaKey in
                return !rsaKey.strPublicKey.isEmpty && !rsaKey.strAesKey.isEmpty
            })
        
        let onLogin = onCallRSA
            .filter{$0}
            .withLatestFrom(Driver.combineLatest(input.onChangeUser, input.onChangePass))
            .flatMapLatest { username, password -> Driver<Void> in

                self.useCase.login(dto: LoginDto(username: username, password: password))
                    .asDriverOnErrorJustComplete()
            }.drive()
            .disposed(by: disposeBag)
           
        
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
