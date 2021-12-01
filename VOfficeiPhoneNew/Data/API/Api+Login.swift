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
    
    func postGetUserInfoInput(_ input: PostGetUserInfoInput) -> Observable<PostGetUserInfoOutput>{
        return request(input)
    }
}

/// CALL RSA
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

/// CALL LOGIN
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
            super.init(urlString: API.Urls.postApiLogin, parameters: dict, method: .post, requireAccessToken: false)
        }
    }
    
    
    
    final class PostAPILoginOutput: APIOutput, Equatable{
        private(set) var errCode: Int?
        private(set) var detailErr: String?
        private(set) var userConfig: UserConfig?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            if mess?.statusCode == 200 {
                guard let descryptData = descryptData else { return }
                print("PostAPILoginOutput - mapping - descryptData", descryptData)
                userConfig = Mapper<UserConfig>().map(JSON: descryptData)
                print("PostAPILoginOutput - mapping - userConfig", userConfig)
            }else{
                errCode <- map["result.data.errCode"]
                detailErr <- map["result.data.detailErr"]
            }
        }
        
        static func == (lhs: API.PostAPILoginOutput, rhs: API.PostAPILoginOutput) -> Bool {
            return lhs.data == rhs.data
        }
    }
}

/// CALL GET INFO USER
extension API{
    final class PostGetUserInfoInput: APIInput{
        init(){
            super.init(urlString: API.Urls.postGetUserInfo, parameters: nil, method: .post, requireAccessToken: false)
        }
    }
    
    final class PostGetUserInfoOutput: APIOutput, Equatable{
        private(set) var user: User?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            guard let descryptData = descryptData else { return }
            print("PostAPILoginOutput - mapping - descryptData", descryptData)
            user = Mapper<User>().map(JSON: descryptData)
            print("PostGetUserInfoOutput - user", user)
        }
        
        static func == (lhs: API.PostGetUserInfoOutput, rhs: API.PostGetUserInfoOutput) -> Bool {
            return lhs.data == rhs.data
        }
    }
}

