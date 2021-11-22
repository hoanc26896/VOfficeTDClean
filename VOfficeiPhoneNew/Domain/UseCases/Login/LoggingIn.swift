//
//  LoggingIn.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 6/26/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import RxSwift
import ValidatedPropertyKit
import Dto

protocol LoggingIn {
    var rsaGateway: RSAGatewayType {get}
}

extension LoggingIn {
    func login(dto: LoginDto) -> Observable<Void> {
        if let error = dto.validationError {
            return Observable.error(error)
        }
        print(dto.username)
        print(dto.password)
        
        return Observable.create { observer in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
                observer.onNext(())
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
    
    func postRSAKeyPublic() -> Observable<RSAKey> {
        return rsaGateway.postRSAKeyPublicGateway()
    }
    
    
    func validateUserName(_ username: String) -> ValidationResult {
        return LoginDto.validateUserName(username).mapToVoid()
    }
    
    func validatePassword(_ password: String) -> ValidationResult {
        return LoginDto.validatePassword(password).mapToVoid()
    }
}
