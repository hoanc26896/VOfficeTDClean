//
//  RSAKey.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import ObjectMapper
import Then

struct RSAKey {
    public static var share = RSAKey()
    
    var strPublicKey: String = ""
    var strAesKey: String = ""
}

extension RSAKey: Then, Equatable { }

extension RSAKey: Mappable {
    init?(map: Map) {
        self.init()
    }

    mutating func mapping(map: Map) {
        print("map[strPublicKey]", map["strPublicKey"])
        strPublicKey <- map["strPublicKey"]
        strAesKey <- map["strAesKey"]
    }
}
