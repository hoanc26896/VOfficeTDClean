//
//  Api+Login.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import ObjectMapper
import RxSwift
import MGAPIService

extension API{
    func postRSAKeyPublic(_ input: PostRSAKeyPublicInput) -> Observable<PostRSAKeyPublicOutput>{
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
            print("mapping", map)
            rsaKey <- map["result"]
        }
        
        static func == (lhs: API.PostRSAKeyPublicOutput, rhs: API.PostRSAKeyPublicOutput) -> Bool {
            lhs.rsaKey == rhs.rsaKey
        }
    }
}
