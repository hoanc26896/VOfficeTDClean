//
//  Constant.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/22/21.
//

import Foundation

public class Constant {
    private static let constant = Constant()
    
    static func share() -> Constant{
        return constant
    }
    
    var rsaKey: RSAKey?
    var userConfig: UserConfig?
    var user: User?
}
