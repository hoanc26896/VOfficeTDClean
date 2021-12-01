//
//  APIInput.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import Alamofire
import MGAPIService
import RsaSignner

class APIInput: APIInputBase {
    // swiftlint:disable:this final_class
    
    
    override init(urlString: String,
                  parameters: [String: Any]?,
                  method: HTTPMethod = .post,
                  requireAccessToken: Bool) {
        if let publicRsaKey = Constant.share().rsaKey?.strPublicKeyPost, let strDataPost = Constant.share().rsaKey?.strDataPost, !publicRsaKey.isEmpty && !strDataPost.isEmpty, let aesKey = Constant.share().rsaKey?.strAesKeyRsa, let ivKey = Constant.share().rsaKey?.strKeyIvAes {
            let data:String = Util.encryptAES256Dictionary(toHexString: parameters ?? [:], withKey: aesKey, andIV: ivKey)
            
            let jsonParams: [String : Any] = [
                API.CommonDataParamKey.data: data,
                API.CommonDataParamKey.publicRsaKey: publicRsaKey,
                API.CommonDataParamKey.aesKey: strDataPost,
                API.CommonDataParamKey.isIos: "1"
            ]
            super.init(urlString: urlString,
                       parameters: jsonParams,
                       method: method,
                       requireAccessToken: requireAccessToken)
        }else{
            super.init(urlString: urlString,
                       parameters: parameters,
                       method: method,
                       requireAccessToken: requireAccessToken)
        }
        let transactionTime = "\(Date().timeIntervalSince1970 * 1000)"
        self.encoding = URLEncoding.httpBody
        self.user = nil
        self.password = nil
        self.headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "transactionTime": transactionTime
        ]
        guard let userConfig = Constant.share().userConfig, let sessionId = userConfig.strSessionId, !sessionId.isEmpty else { return }
        self.headers?.add(name: "session_id", value: sessionId)
        print("self.headers", self.headers)
        
    }
}
