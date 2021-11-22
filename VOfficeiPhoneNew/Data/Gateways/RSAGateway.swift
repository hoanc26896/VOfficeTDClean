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
}

struct RSAGateway: RSAGatewayType {
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
