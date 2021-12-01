//
//  APIOutput.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import ObjectMapper
import MGAPIService
import RsaSignner

class APIOutput: APIOutputBase {  // swiftlint:disable:this final_class
    var mess: Mess?
    var data: String?
    var descryptData: [String: Any]?
    
    override func mapping(map: Map) {
        mess <- map["result.mess"]
        data <- map["result.data"]
        guard let rsaKey = Constant.share().rsaKey, let data = data, !data.isEmpty,
              !rsaKey.strAesKeyRsa.isEmpty,
              !rsaKey.strKeyIvAes.isEmpty
        else {
            return
        }
        descryptData = Util.decryptAES256HexString(toDictionary: data, withKey: rsaKey.strAesKeyRsa, andIV: rsaKey.strKeyIvAes) as? [String: Any]
        print("APIOutput - descryptData", descryptData)
    }
}

class Mess: APIOutputBase{
    var message: String?
    var statusCode: Int?
    
    override func mapping(map: Map) {
        message <- map["message"]
        statusCode <- map["errorCode"]
    }
}


