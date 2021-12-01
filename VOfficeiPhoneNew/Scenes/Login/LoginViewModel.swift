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
    let tryAgainLogin = PublishSubject<Void>()
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
        
        // Change Segment Language
        let defaultLanguage = input.onLoad.map { _ in
            self.defaultLanguage()
        }.asDriver()
        let changeLanguageTrigger = Driver.merge(defaultLanguage, input.onChangeLanguage)
        
        changeLanguageTrigger
            .filter(self.filterLanguage)
            .map(self.mapLanguage)
            .unwrap()
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
        
        let onLogin = Driver.merge(input.onLogin, tryAgainLogin.asDriver(onErrorJustReturn: ()))
        
        // Validate username, password
        let usernameValidation = onLogin.withLatestFrom(input.onChangeUser)
            .map { $0 }
            .map(useCase.validateUserName(_:))
        
        let messageUserValidation = usernameValidation
            .map { $0.message }
        
        let passwordValidation = onLogin.withLatestFrom(input.onChangePass)
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
        
        // Call service
        let onCallRSA = onLogin
            .withLatestFrom(isAllowLogin)
            .filter{$0}
            .flatMap({ _ -> Driver<RSAKey> in
                return self.useCase.postRSAKeyPublic().trackError(errorTracker).trackActivity(activityIndicator).asDriverOnErrorJustComplete()
            })
            .map({ rsaKey in
                return !rsaKey.strAesKeySSO.isEmpty && !rsaKey.strPublicKeySSO.isEmpty
            })
        
        let _ = onCallRSA
            .filter{$0}
            .withLatestFrom(Driver.combineLatest(input.onChangeUser, input.onChangePass))
            .flatMapLatest { username, password -> Driver<Bool> in
                print("onCallLogin - username", username)
                print("onCallLogin - password", password)
                return self.useCase.login(dto: LoginDto(username: username, password: password))
                    .trackError(errorTracker).trackActivity(activityIndicator).asDriverOnErrorJustComplete()
                
            }.map { result in
                return result
            }
            .filter{$0}
            .drive { _ in
                let _ = Single.zip(self.useCase.postGetUserInfo(), self.useCase.postGetCountHome(), self.useCase.postGetSupportCustomerInfo()) {
                    return ($0, $1, $2)
                }
                    .compactMap { (isGetInfoSuccess, isGetCountHomeSuccess, isGetSupportCustomer) in
                        return isGetInfoSuccess && isGetCountHomeSuccess && isGetSupportCustomer
                    }
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriver(onErrorJustReturn: false)
                    .filter{$0}
                    .drive(onNext: { _ in
                        print("navigation")
                    }).disposed(by: disposeBag)
                
            }.disposed(by: disposeBag)
        return output
    }
}

extension LoginViewModel: LoginViewModelProtocol{
    func defaultLanguage() -> Int {
        let lang = AppSettings.language
        return lang == "en" ? 1 : 0
    }
    
    
    
    func mapLanguage(selectIndex: Int) -> String {
        return selectIndex == 1 ? "en" : "vi"
    }
    
    func filterLanguage(selectIndex: Int) -> Bool {
        if selectIndex < 0 {return false}
        let lang = AppSettings.language
        let newLang = selectIndex == 1 ? "en" : "vi"
        return lang != newLang
    }
    
    
    
}
