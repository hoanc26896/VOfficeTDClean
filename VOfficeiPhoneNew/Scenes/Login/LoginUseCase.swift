//
//  LoginUseCase.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import Dto
import RxSwift
import ValidatedPropertyKit

protocol LoginUseCaseType {
    func validateUserName(_ username: String) -> ValidationResult
    func validatePassword(_ password: String) -> ValidationResult
    func login(dto: LoginDto) -> Observable<Void>
}

struct LoginUseCase: LoginUseCaseType, LoggingIn {
    
}
