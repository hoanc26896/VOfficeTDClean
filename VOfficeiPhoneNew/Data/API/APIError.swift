//
//  APIError.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import MGAPIService
import Foundation

struct APIResponseError: APIError {
    let statusCode: Int?
    let message: String
    
    var errorDescription: String? {
        return message
    }
}

protocol CommonApiErrorProtocol: Error {
    func getMessage() -> String
}
    
enum CommonApiError: CommonApiErrorProtocol{
    case apiNotConnectToNetwork
    case apiNotConnectToInternet
    case timeout
    
    func getMessage() -> String {
        var result = ""
        switch self {
        case .apiNotConnectToInternet:
            result = L10n.coreCommonCannotConnectToInternet
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

enum LoginApiError: CommonApiErrorProtocol {
    enum ErrorCode801: CommonApiErrorProtocol{
        case accountLockedDueManyTimesIncorrect
        case accountNotActivatedOrLocked
        case accountLockedDueExpiredPassword
        case accountIsWrong
        case unknowError(String)
        func getMessage() -> String {
            switch self {
            case .accountLockedDueManyTimesIncorrect:
                return L10n.coreLoginErrorAccountLockedDueEnterWrongManyTimeYouShouldChangePasswordToUnlock
                break
            case .accountNotActivatedOrLocked:
                return L10n.coreLoginErrorNotActiveOrLocked
                break
            case .accountLockedDueExpiredPassword:
                return L10n.coreLoginErrorLockedDueExpiredPasswordYouShouldChangePasswordToUnlock
                break
            case .accountIsWrong:
                return L10n.coreLoginErrorEnterWrong
                break
            case .unknowError(let error):
                return error
                break
            default:
                break
            }
        }
    }
    
    func getMessage() -> String {
        switch self {
        case .accountLockedDueManyTimesIncorrect:
            return L10n.coreLoginErrorAccountLockedDueEnterWrongManyTime
            break
        case .accountNotActivatedOrLocked:
            return L10n.coreLoginErrorNotActiveOrLocked
            break
        case .accountLockedDueExpiredPassword:
            return L10n.coreLoginErrorLockedDueExpiredPassword
            break
        case .accountIsWrong:
            return L10n.coreLoginErrorEnterWrong
            break
        default:
            break
        }
    }
    
    case accountLockedDueManyTimesIncorrect
    case accountNotActivatedOrLocked
    case accountLockedDueExpiredPassword
    case accountIsWrong
   
}


