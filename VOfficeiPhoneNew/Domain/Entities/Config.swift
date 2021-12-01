//
//  Config.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/1/21.
//

import Foundation
import Then
import ObjectMapper

struct UserConfig{
    var vof2_ItemEntityUser:Vof2_ItemEntityUser?
    var strBlackListPass: String?
    var loginBySSo: LoginBySSOEnum?
    var strSessionId: String?
}

extension UserConfig: Then, Equatable{
    static func == (lhs: UserConfig, rhs: UserConfig) -> Bool {
        return lhs.strSessionId == rhs.strSessionId
    }
}

extension UserConfig: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        vof2_ItemEntityUser <- map["vof2_ItemEntityUser"]
        strBlackListPass <- map["strBlackListPass"]
        loginBySSo <- map["loginBySSo"]
        strSessionId <- map["strSessionId"]
    }
}

struct CountHomeConfig{
    var countTextWaitSign: Int = 0
    var countTextWaitSignMoney: Int = 0
    var totalKyVB: Int{
        get{
            return countTextWaitSign + countTextWaitSignMoney
        }
    }
    var totalCongvan: Int = 0
    var countTextSecretaryWaitSign: Int = 0
}

extension CountHomeConfig: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        countTextWaitSign <- map["countTextWaitSign"]
        countTextWaitSignMoney <- map["countTextWaitSignMoney"]
        totalCongvan <- map["docProcessing"]
        countTextSecretaryWaitSign <- map["countTextSecretaryWaitSign"]
    }
}

struct SupportCustomerInfoConfig{
    var supportPhoneEn: String?
    var supportPhoneVn: String?
    var infoSupportEn: String?
    var infoSupportVn: String?
}

extension SupportCustomerInfoConfig: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        supportPhoneEn <- map["support_phone_en"]
        supportPhoneVn <- map["support_phone_vn"]
        infoSupportEn <- map["info_support_en"]
        infoSupportVn <- map["info_support_vn"]
    }
}
