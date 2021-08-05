//
//  LoginViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import MGArchitecture
import RxSwift
import RxCocoa
import ValidatedPropertyKit

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
        var selectSegment:Driver<Int>
        var biometricTouch: Driver<Void>
    }
    
    struct Output {
        @Property var userValidation = ValidateLoginError(isValid: false, message: "")
        @Property var passValidation = ValidateLoginError(isValid: false, message: "")
        @Property var segmentIndex = LoginViewController.VIETNAMMESE_SM_INDEX
        @Property var isLoading = false
        @Property var error: Error?
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        // Check whether username has valid When click login button ?
        let usernameValidation = input.login
            .withLatestFrom(input.username)
            .map(useCase.validateUserName(_:))
            .map { result in
                return ValidateLoginError(isValid: result.isValid, message: result.message)
            }
        
        usernameValidation.filter{!$0.isValid}.drive(output.$userValidation).disposed(by: disposeBag)
        
        
        // Check whether username has valid When click login button ?
        let passwordValidation = input.login
            .withLatestFrom(input.password)
            .map(useCase.validatePassword(_:))
            .map { result in
                return ValidateLoginError(isValid: result.isValid, message: result.message)
            }
        
        
        passwordValidation.filter{!$0.isValid}.drive(output.$passValidation).disposed(by: disposeBag)
        
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        
        errorTracker
            .drive(output.$error)
            .disposed(by: disposeBag)
        
        let isLoading = activityIndicator.asDriver()
        
        isLoading
            .drive(output.$isLoading)
            .disposed(by: disposeBag)
        
        let validation = Driver.and(
            usernameValidation.map { $0.isValid },
            passwordValidation.map { $0.isValid }
        )
        .startWith(false)
        
        let isLoginEnabled = Driver.merge(validation, isLoading.not())
        
        
        // Action Login
        input.login
            .withLatestFrom(isLoginEnabled)
            .filter { $0 }
            .withLatestFrom(Driver.combineLatest(input.username, input.password))
            .flatMapLatest { username, password in
                self.useCase.login(dto: LoginDto(username: username, password: password))
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }.do(onNext: {})
            .drive()
            .disposed(by: disposeBag)
        
        // Action tap button touchId
//        input.biometricTouch.drive (onNext: { _ in
//            BiometricContext.showBiometricEvalute().subscribe { _ in
//                print("input.biometricTouch onNext")
//            }
//        })
//        .disposed(by: disposeBag)
        
        // Action change language in segmentControl
//        input.selectSegment.map { segmentIndex in
//            let languageSegment = segmentIndex == LoginViewController.VIETNAMMESE_SM_INDEX ? "vi" : "en"
//            useCase.applyLanguage(languageSegment)
//
//            return languageSegment == "vi" ? LoginViewController.VIETNAMMESE_SM_INDEX : LoginViewController.ENGLIST_SM_INDEX
//        }.drive(output.$segmentIndex).disposed(by: disposeBag)
        
       

        
        return output
    }
}
