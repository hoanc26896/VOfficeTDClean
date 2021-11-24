//
//  APIUrls.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import Foundation

extension API {
    static let BaseUrl = "http://10.60.108.86:8599"
    static let ApplicationContext = "ServiceMobile_V02/resources"

    enum Urls {
        static let postRSAKeyPublic = "\(BaseUrl)/\(ApplicationContext)/Authenticate/getRsaKeyPublic"
        static let postApiLogin = "\(BaseUrl)/\(ApplicationContext)/Authenticate/login"
    }
    
    enum CommonDataParamKey{
        static let data = "data"
        static let publicRsaKey = "publicRsaKey"
        static let aesKey = "aesKey"
        static let isIos = "isIos"
    }
    
    enum CommonParamKey{
        static let deviceName = "deviceName"
        static let tempTime = "tempTime"
        static let transactionTime = "transactionTime"
    }
    
    enum LoginParamKey{
        static let passWord = "passWord"
        static let loginName = "loginName"
        static let language = "language"
        static let vof2Key = "vof2Key"
        static let isTask = "isTask"
    }
}
