//
//  LoginUseCase.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//
import Dto
import RxSwift
import ValidatedPropertyKit

protocol LoginUseCaseType {
    func changeLanguage(lang: String) -> Void
    func validateUserName(_ username: String) -> ValidationResult
    func validatePassword(_ password: String) -> ValidationResult
    func postRSAKeyPublic() -> Observable<RSAKey>
    func login(dto: LoginDto) -> Observable<Void>
}

struct LoginUseCase: LoginUseCaseType, LoggingIn {
    var rsaGateway: RSAGatewayType
    
    func changeLanguage(lang: String) {
        AppSettings.language = lang
        Bundle.setLanguage(with: lang)
    }
    
 
}
