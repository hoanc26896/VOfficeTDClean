//
//  Api+Login.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import ObjectMapper
import RxSwift
import MGAPIService
import RsaSignner

extension API{
    func postRSAKeyPublic(_ input: PostRSAKeyPublicInput) -> Observable<PostRSAKeyPublicOutput>{
        return request(input)
    }
    
    func postApiLogin(_ input: PostAPILoginInput) -> Observable<PostAPILoginOutput>{
        return request(input)
    }
}

extension API{
    final class PostRSAKeyPublicInput: APIInput {
        init(){
            super.init(urlString: API.Urls.postRSAKeyPublic, parameters: nil, method: .post, requireAccessToken: false)
        }
    }
    
    final class PostRSAKeyPublicOutput: APIOutput, Equatable {
        private(set) var rsaKey: RSAKey?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            rsaKey <- map["result.data"]
        }
        
        static func == (lhs: API.PostRSAKeyPublicOutput, rhs: API.PostRSAKeyPublicOutput) -> Bool {
            lhs.rsaKey == rhs.rsaKey
        }
    }
}

extension API{
    class PostAPILoginInputParams: CommonParams{
        var password: String = ""
        var loginName: String = ""
        var language:String = AppSettings.language
        var vof2Key: String = ""
        var isTask: Int = 1
        
        init(_ loginName: String,_ password: String) {
            super.init()
            self.password = password.base64EncodedSHA1Hash() ?? ""
            self.loginName = loginName
            self.vof2Key = password
        }
    }
    
    final class PostAPILoginInput: APIInput{
        init(params: PostAPILoginInputParams) {
            print("PostAPILoginInput - params", params)
            if let publicRsaKey = Constant.share().rsaKey?.strPublicKeyPost, let strDataPost = Constant.share().rsaKey?.strDataPost, !publicRsaKey.isEmpty && !strDataPost.isEmpty, let aesKey = Constant.share().rsaKey?.strAesKeyRsa, let ivKey = Constant.share().rsaKey?.strKeyIvAes {
                let dict: [String : Any] = [
                    API.CommonParamKey.deviceName: params.deviceName,
                    API.CommonParamKey.transactionTime: params.transactionTime,
                    API.CommonParamKey.tempTime: params.tempTime,
                    
                    API.LoginParamKey.passWord: params.password,
                    API.LoginParamKey.vof2Key: params.vof2Key,
                    API.LoginParamKey.loginName: params.loginName,
                    API.LoginParamKey.isTask: params.isTask,
                    API.LoginParamKey.language: params.language
                ]
                print("PostAPILoginInput - dict", dict)
                
                let data:String = Util.encryptAES256Dictionary(toHexString: dict, withKey: aesKey, andIV: ivKey)
                let jsonParams: [String : Any] = [
                    API.CommonDataParamKey.data: data,
                    API.CommonDataParamKey.publicRsaKey: publicRsaKey,
                    API.CommonDataParamKey.aesKey: strDataPost,
                    API.CommonDataParamKey.isIos: "1"
                ]
                print("PostAPILoginInput - jsonParams", jsonParams)
                super.init(urlString: API.Urls.postApiLogin, parameters: jsonParams, method: .post, requireAccessToken: false)
            } else {
                
                super.init(urlString: API.Urls.postApiLogin, parameters: nil, method: .post, requireAccessToken: false)
            }
            
        }
    }
    
    
    
    final class PostAPILoginOutput: APIOutput, Equatable{
        private(set) var data:String?
        private(set) var userConfig: UserConfig?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            data <- map["result.data"]
            guard let data = data, !data.isEmpty,
                  let aesKey = Constant.share().rsaKey?.strAesKeyRsa,
                  let ivKey = Constant.share().rsaKey?.strKeyIvAes,
                  let decryptData = Util.decryptAES256HexString(toDictionary: data, withKey: aesKey, andIV: ivKey) as? [String: Any] else {
                      data = nil
                      return
                  }
           
            userConfig = Mapper<UserConfig>().map(JSON: decryptData)
            print("PostAPILoginOutput - mapping - userConfig", userConfig)
        }
        
        static func == (lhs: API.PostAPILoginOutput, rhs: API.PostAPILoginOutput) -> Bool {
            return true
        }
        
        
    }
}
