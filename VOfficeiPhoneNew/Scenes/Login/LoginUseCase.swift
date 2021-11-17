//
//  LoginUseCase.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import RxSwift

protocol LoginUseCaseType {
    func changeLanguage(lang: String) -> Void
}

struct LoginUseCase: LoginUseCaseType {
    func changeLanguage(lang: String) {
        AppSettings.language = lang
        Bundle.setLanguage(with: lang)
    }
}
