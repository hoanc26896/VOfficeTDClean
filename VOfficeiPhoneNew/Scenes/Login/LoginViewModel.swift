//
//  LoginViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct LoginViewModel {
    let navigator: LoginNavigatorType
    let useCase: LoginUseCaseType
}

// MARK: - ViewModel
extension LoginViewModel: ViewModel {
    struct Input {
        var username: Driver<String>
        var password: Driver<String>
        var login: Driver<Void>
    }
    
    struct Output {
        @Property var usernameValidationMessage = ""
        @Property var passwordValidationMessage = ""
        @Property var isLoginEnabled = true
        @Property var isLoading = false
        @Property var error: Error?
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        
        errorTracker
       .drive(output.$error)
       .disposed(by: disposeBag)
               
        let isLoading = activityIndicator.asDriver()

        isLoading
           .drive(output.$isLoading)
           .disposed(by: disposeBag)
        
        let usernameValidation = Driver.combineLatest(input.username, input.login).map({ username, login in
            return username
        }).map(useCase.validateUserName(_:))
        
        usernameValidation.map{$0.message}.drive(output.$usernameValidationMessage).disposed(by: disposeBag)
        
        let passwordValidation = Driver.combineLatest(input.password, input.login).map({ password, login in
                   return password
               }).map(useCase.validatePassword(_:))
               
        passwordValidation.map{$0.message}.drive(output.$passwordValidationMessage).disposed(by: disposeBag)
        
        let validation = Driver.and(usernameValidation.map{$0.isValid}, passwordValidation.map{$0.isValid}).startWith(false)
        
        let isLoginEnabled = Driver.merge(validation, isLoading.not())
        
        isLoginEnabled.drive(output.$isLoginEnabled).disposed(by: disposeBag)
        
        input.login
            .withLatestFrom(isLoginEnabled)
            .filter{$0}
            .withLatestFrom(Driver.combineLatest(input.username, input.password))
            .flatMapLatest { username, password in
                self.useCase.login(dto: LoginDto(username: username, password: password))
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }.do(onNext: {})
            .drive()
            .disposed(by: disposeBag)
           
        
        
        return output
    }
}
