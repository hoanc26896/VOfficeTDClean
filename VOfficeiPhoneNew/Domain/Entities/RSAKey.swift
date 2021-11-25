//
//  RSAKey.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import ObjectMapper
import Then
import RsaSignner
import Foundation

struct RSAKey {
    var strPublicKeyRsa: String = ""
    var strPublicKeySSO: String = ""
    var strAesKeySSO: String = ""
    var strAesKeyRsa: String = ""
    var strKeyIvAes: String = ""
    
    var strAesPost: String = ""
    var strPublicKeyPost: String = ""
    var strDataPost: String = ""
    
    init(strPublicKey: String, strAesKey: String) {
        self.strPublicKeySSO = strPublicKey
        self.strAesKeySSO = strAesKey
        if !self.strPublicKeySSO.isEmpty{
            let hexData: Data = X509Util.string(toHex: strPublicKeySSO)
            self.strPublicKeyRsa = hexData.base64EncodedString()
            self.strAesKeyRsa = X509Util.randomBitAESKey(withLength: 16)
            self.strKeyIvAes = X509Util.randomBitAESKey(withLength: 8)
            
            self.strAesPost = "\(strAesKeyRsa)VIAESKEYSPACE\(strKeyIvAes)"
            self.strPublicKeyPost = strPublicKeySSO
            self.strDataPost = RSAFile.encryptString(strAesPost, publicKey: strPublicKeyRsa)
        }
    }
}

extension RSAKey: Then, Equatable { }

extension RSAKey: Mappable {
    init?(map: Map) {
        guard let strPublicKey = map.JSON["strPublicKey"] as? String, let strAesKey = map.JSON["strAesKey"] as?String, !strPublicKey.isEmpty && !strAesKey.isEmpty else {
            self.init(strPublicKey: "", strAesKey: "")
            return }
        self.init(strPublicKey: strPublicKey, strAesKey: strAesKey)
    }

    mutating func mapping(map: Map) {
        strPublicKeySSO <- map["strPublicKey"]
        strAesKeySSO <- map["strAesKey"]
        if !strPublicKeySSO.isEmpty{
            let hexData: Data = X509Util.string(toHex: strPublicKeySSO)
            strPublicKeyRsa = NSString.base64String(from: hexData, length: UInt(hexData.count))
            strAesKeyRsa = X509Util.randomBitAESKey(withLength: 16)
            strKeyIvAes = X509Util.randomBitAESKey(withLength: 8)
            
            strAesPost = "\(strAesKeyRsa)VIAESKEYSPACE\(strKeyIvAes)"
            strPublicKeyPost = strPublicKeySSO
            strDataPost = RSAFile.encryptString(strAesPost, publicKey: strPublicKeyRsa)
        }
       
    }
}
