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
   
        init(_ password: String,_ loginName: String) {
             super.init()
             self.password = password
             self.loginName = loginName
             self.vof2Key = password
         }
    }
    
    final class PostAPILoginInput: APIInput{
        init(params: PostAPILoginInputParams) {
            
            let data:String = Util.encryptAES256Dictionary(toHexString: [
                API.CommonParamKey.deviceName: params.deviceName,
                API.CommonParamKey.transactionTime: params.transactionTime,
                API.CommonParamKey.tempTime: params.transactionTime,
                
                API.LoginParamKey.passWord: params.password,
                API.LoginParamKey.vof2Key: params.vof2Key,
                API.LoginParamKey.loginName: params.loginName,
                API.LoginParamKey.isTask: params.isTask,
                API.LoginParamKey.language: params.language
            ], withKey: Constant.share().rsaKey?.strAesKeyRsa, andIV: Constant.share().rsaKey?.strKeyIvAes)
            print("PostAPILoginInput - data", data)
            print("PostAPILoginInput - Constant.share().rsaKey?.strPublicKeyPost", Constant.share().rsaKey?.strPublicKeyPost)
            print("PostAPILoginInput - Constant.share().rsaKey?.strDataPost", Constant.share().rsaKey?.strDataPost)
            if let data = data as? String, !data.isEmpty, let publicRsaKey = Constant.share().rsaKey?.strPublicKeyPost, let strDataPost = Constant.share().rsaKey?.strDataPost {
                print("PostAPILoginInput - data", data)
                print("PostAPILoginInput - publicRsaKey", publicRsaKey)
                print("PostAPILoginInput - strDataPost", strDataPost)
                let jsonParams: JSONDictionary = [
                    API.CommonDataParamKey.data: data,
                    API.CommonDataParamKey.publicRsaKey: publicRsaKey,
                    API.CommonDataParamKey.aesKey: strDataPost,
                    API.CommonDataParamKey.isIos: 1
                ]
                print("PostAPILoginInput - jsonParams", jsonParams)
                super.init(urlString: API.Urls.postApiLogin, parameters: jsonParams, method: .post, requireAccessToken: false)
            } else {
               
                super.init(urlString: API.Urls.postApiLogin, parameters: nil, method: .post, requireAccessToken: false)
            }
           
        }
    }
    
    final class PostAPILoginOutput: APIOutput, Equatable{
        static func == (lhs: API.PostAPILoginOutput, rhs: API.PostAPILoginOutput) -> Bool {
            return true
        }
        
        
    }
}
