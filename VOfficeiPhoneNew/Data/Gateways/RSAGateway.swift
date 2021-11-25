//
//  RSAGateway.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import UIKit
import RxSwift
import MGArchitecture
import Then

protocol RSAGatewayType{
    func postRSAKeyPublicGateway() -> Observable<RSAKey>
    func postApiLoginGateway(username: String, password: String) -> Observable<Void>
}

struct RSAGateway: RSAGatewayType {
    func postApiLoginGateway(username: String, password: String) -> Observable<Void> {
        let params = API.PostAPILoginInputParams(username, password)
        let input = API.PostAPILoginInput(params: params)
        return API.shared.postApiLogin(input).map { result in
            print("result", result)
            return ()
        }
    }
    
    func postRSAKeyPublicGateway() -> Observable<RSAKey> {
        let input = API.PostRSAKeyPublicInput()
        return API.shared.postRSAKeyPublic(input)
            .map{$0.rsaKey}
            .unwrap()
            .distinctUntilChanged{$0 == $1}
            .map { rsaKey in
                Constant.share().rsaKey = rsaKey
            return rsaKey
            }
    }
    
    
    
    
}
