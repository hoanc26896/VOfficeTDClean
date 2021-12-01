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
    func login(dto: LoginDto) -> Observable<Bool>
    func postGetUserInfo() -> Single<Bool>
    func postGetCountHome() -> Single<Bool>
    func postGetSupportCustomerInfo() -> Single<Bool>
}

struct LoginUseCase: LoginUseCaseType, LoggingIn {
    var rsaGateway: LoginGatewayType
    
    func changeLanguage(lang: String) {
        AppSettings.language = lang
        Bundle.setLanguage(with: lang)
    }
    
 
}
