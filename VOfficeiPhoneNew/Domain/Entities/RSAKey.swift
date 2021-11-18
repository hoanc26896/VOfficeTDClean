//
//  RSAKey.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import ObjectMapper
import Then

struct RSAKey {
    var strPublicKey: String
    var strAesKey: String

}

extension RSAKey: Then, Equatable { }

extension RSAKey: Mappable {
    init?(map: Map) {
        self.init(map: map)
    }
    
    mutating func mapping(map: Map) {
        strPublicKey <- map["strPublicKey"]
        strAesKey <- map["strAesKey"]
    }
}
