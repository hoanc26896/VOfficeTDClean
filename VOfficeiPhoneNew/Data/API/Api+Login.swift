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
    func postRSAKeyPublicApi(_ input: PostRSAKeyPublicInput) -> Observable<PostRSAKeyPublicOutput>{
        return request(input)
    }
    
    func postApiLogin(_ input: PostAPILoginInput) -> Observable<PostAPILoginOutput>{
        return request(input)
    }
    
    func postGetUserInfoApi(_ input: PostGetUserInfoInput) -> Observable<PostGetUserInfoOutput>{
        return request(input)
    }
    
    func postGetCountHomeApi(_ input: PostGetCountHomeInput) -> Observable<PostGetCountHomeOutput>{
        return request(input)
    }
    
    func postGetSupportCustomerInfoApi(_ input: PostGetSupportCustomerInfoInput) -> Observable<PostGetSupportCustomerInfoOutput>{
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
                
                userConfig = Mapper<UserConfig>().map(JSON: descryptData)
                
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
            super.init(urlString: API.Urls.postGetUserInfo, parameters: nil, method: .post, requireAccessToken: true)
        }
    }
    
    final class PostGetUserInfoOutput: APIOutput, Equatable{
        private(set) var user: User?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            guard let descryptData = descryptData else { return }
            user = Mapper<User>().map(JSON: descryptData)
        }
        
        static func == (lhs: API.PostGetUserInfoOutput, rhs: API.PostGetUserInfoOutput) -> Bool {
            return lhs.data == rhs.data
        }
    }
}

/// Call get Count Home
extension API{
    final class PostGetCountHomeInput: APIInput{
        init(){
            super.init(urlString: API.Urls.postGetCountHome, parameters: nil,method: .post, requireAccessToken: true)
        }
    }
    
    final class PostGetCountHomeOutput: APIOutput, Equatable{
        static func == (lhs: API.PostGetCountHomeOutput, rhs: API.PostGetCountHomeOutput) -> Bool {
            return lhs.data == rhs.data
        }
        
        private(set) var countHome: CountHomeConfig?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            guard let descryptData = descryptData else { return }
            countHome = Mapper<CountHomeConfig>().map(JSON: descryptData)
        }
    }
}

/// CALL CSKH
extension API{
    final class PostGetSupportCustomerInfoInput: APIInput{
        init(){
            super.init(urlString: API.Urls.postGetCSKH, parameters: nil, requireAccessToken: true)
        }
    }
    
    final class PostGetSupportCustomerInfoOutput: APIOutput, Equatable{
        static func == (lhs: API.PostGetSupportCustomerInfoOutput, rhs: API.PostGetSupportCustomerInfoOutput) -> Bool {
            return lhs.data == rhs.data
        }
        
        private(set) var supportCustomerInfoConfig: SupportCustomerInfoConfig?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
           
            supportCustomerInfoConfig <- map["result.data"]
        }
        
        
        
    }
}
