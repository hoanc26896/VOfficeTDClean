//
//  LoginDto.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 8/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Dto
import ValidatedPropertyKit

struct LoginDto: Dto {
    @Validated(.nonEmpty(message: localize(key: "lg_dong_chi_chua_nhap_tai_khoan", comment: "Message When Username empty")))
    var username: String? = ""
    
    @Validated(.nonEmpty(message: localize(key: "lg_dong_chi_chua_nhap_mat_khau", comment: "Message When Username empty")))
    var password: String? = ""
    
    var validatedProperties: [ValidatedProperty] {
        return [_username, _password]
    }
}

extension LoginDto {
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    static func validateUserName(_ username: String) -> Result<String, ValidationError> {
        LoginDto()._username.isValid(value: username)
    }
    
    static func validatePassword(_ password: String) -> Result<String, ValidationError> {
        LoginDto()._password.isValid(value: password)
    }
}
