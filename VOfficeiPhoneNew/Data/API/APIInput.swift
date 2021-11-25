//
//  APIInput.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import Alamofire
import MGAPIService

class APIInput: APIInputBase {
    // swiftlint:disable:this final_class
    
    
    override init(urlString: String,
                  parameters: [String: Any]?,
                  method: HTTPMethod = .post,
                  requireAccessToken: Bool) {
        super.init(urlString: urlString,
                   parameters: parameters,
                   method: method,
                   requireAccessToken: requireAccessToken)
        let transactionTime = "\(Date().timeIntervalSince1970 * 1000)"
        self.headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "transactionTime": transactionTime
        ]
        self.encoding = URLEncoding.httpBody
        self.user = nil
        self.password = nil
    }
}
