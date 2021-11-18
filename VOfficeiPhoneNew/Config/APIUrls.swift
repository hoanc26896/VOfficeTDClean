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
    }
}
