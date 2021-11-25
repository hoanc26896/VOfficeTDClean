//
//  Error+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/23/21.
//

import Foundation

protocol MyError: Error {
    func getMessage() -> String
}
    
enum CommonError: MyError{
    case apiNotConnectToNetwork
    case apiNotConnectToInternet
    case timeout
    
    func getMessage() -> String {
        var result = ""
        switch self {
        case .apiNotConnectToInternet:
            result = L10n.coreCommonCannotConnectToNetwork
            break
        case .apiNotConnectToNetwork:
            result = L10n.coreCommonCannotConnectToNetwork
            break
        default:
            result = self.localizedDescription
            break
        }
        return result
    }
}


extension Error{
    
}