//
//  UserConfig.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/26/21.
//

import ObjectMapper
import Then
import RsaSignner
import Foundation


struct UserConfig{
    enum LoginBySSO {
        static let yes = 1
        static let no = 0
    }
    
    var vof2_ItemEntityUser:Vof2_ItemEntityUser?
    var strBlackListPass: [String]?
    var loginBySSo: LoginBySSO?
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

struct Vof2_ItemEntityUser {
    // Hiển thị lịch họp được setup bởi admin
    enum ConfigMeetingRoom {
        static let isAdminSetUp = 1
        static let isNotAdminSetup = 0
    }
    
    // Hiển thị tab duyệt người
    enum AssiAproChange{
        static let isApprovePerson = 1
        static let isNotApprovePerson = 0
    }
    
    enum LeafGroup{
        static let belongMinUnit = 1
        static let notBelongMinUnit = 0
    }
    
    enum IsSecrectaryV02{
        static let yes = 1
        static let no = 0
    }
    
    enum IsTranferAllDoc{
        static let yes = 1
        static let no = 0
    }
    
    enum IsVip{
        static let yes = 1
        static let no = 0
    }
    
    var adOrgId: String?
    var adOrgName: String?
    var aliasName: String?
    var configMeetingRoom: ConfigMeetingRoom?
    var fullName: String?
    var hmRole: [String: String]?
    var hmSpecializedOrgId: [String: String]?
    var isAssiAproChange:AssiAproChange?
    var isLeafGroup:LeafGroup?
    var isSecrectaryVo2: IsSecrectaryV02?
    var isTranferAllDoc: IsTranferAllDoc?
    var isVip: IsVip?
    var jobTile: String?
    var languageCode: String?
    var listAssistantVhrOrg: [VhrOrg]?
    var listManagementVhrOrg: [VhrOrg]?
    var listManagementVhrOrgIsDefault: [VhrOrg]?
    var listOrgPath: [String]?
    var listSecretaryOrg: [VhrOrg]?
    var listSecretaryVhrOrg: [String]?
    var lstVhrOrgAll: [String]?
    var lstVhrOrgNotSecretary: [String]?
    var mobileNumber: String?
    var orgPath: String?
    var pathDepart2: String?
    var place: String?
    var roleCode: String?
    var sendFailReason: Int?
    var sendTypeNotSend: Int?
    var strAddress: String?
    var strCardNumber: String?
    var strDateOfBirth: String?
    var strEmail: String?
    var strIdentification: String?
    var sysOrgId: String?
    var sysOrgName: String?
    var sysRoleId: String?
    var timeZone: String?
    var typeNotSend: Int?
    var urlService: String?
    var userId: String?
    var userIdVof1: String?
    var userLanguage: String?
}

extension Vof2_ItemEntityUser: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        adOrgId <- map["adOrgId"]
        adOrgName <- map["adOrgName"]
        aliasName <- map["aliasName"]
        configMeetingRoom <- map["configMeetingRoom"]
        fullName <- map["fullName"]
        hmRole <- map["hmRole"]
        hmSpecializedOrgId <- map["hmSpecializedOrgId"]
        isAssiAproChange <- map["isAssiAproChange"]
        isLeafGroup <- map["isLeafGroup"]
        isSecrectaryVo2 <- map["isSecrectaryVo2"]
        isTranferAllDoc <- map["isTranferAllDoc"]
        isVip <- map["isVip"]
        jobTile <- map["jobTile"]
        languageCode <- map["languageCode"]
        listAssistantVhrOrg <- map["listAssistantVhrOrg"]
        listManagementVhrOrg <- map["listManagementVhrOrg"]
        listManagementVhrOrgIsDefault <- map["listManagementVhrOrgIsDefault"]
        listOrgPath <- map["listOrgPath"]
        listSecretaryOrg <- map["listSecretaryOrg"]
        listSecretaryVhrOrg <- map["listSecretaryVhrOrg"]
        lstVhrOrgAll <- map["lstVhrOrgAll"]
        lstVhrOrgNotSecretary <- map["lstVhrOrgNotSecretary"]
        mobileNumber <- map["mobileNumber"]
        orgPath <- map["orgPath"]
        pathDepart2 <- map["pathDepart2"]
        place <- map["place"]
        roleCode <- map["roleCode"]
        sendFailReason <- map["sendFailReason"]
        sendTypeNotSend <- map["sendTypeNotSend"]
        strAddress <- map["strAddress"]
        strCardNumber <- map["strCardNumber"]
        strDateOfBirth <- map["strDateOfBirth"]
        strEmail <- map["strEmail"]
        strIdentification <- map["strIdentification"]
        sysOrgId <- map["sysOrgId"]
        sysOrgName <- map["sysOrgName"]
        sysRoleId <- map["sysRoleId"]
        timeZone <- map["timeZone"]
        typeNotSend <- map["typeNotSend"]
        urlService <- map["urlService"]
        userId <- map["userId"]
        userIdVof1 <- map["userIdVof1"]
        userLanguage <- map["userLanguage"]
    }
    
    
}

struct ItemEntityUser{
    var aliasName: String?
    var fullName: String?
    var groupId: String?
    var isChangePass: String?
    var isLoginCardId: String?
    var isSecrectaryVo1: Int?
    var listGroupIdLDVof1: [String]?
    var listGroupIdVTVof1: [String]?
    var listRoleIdVof1: [String]?
    var loginName: String?
    var lstGroupAll: [String]?
    var lstGroupOnlyLeader1: [String]?
    var mobileNumber: String?
    var strAddress: String?
    var strCANumber: String?
    var strCASerial: String?
    var strCardNumber: String?
    var strEmail: String?
    var strIdentification: String?
    var userId: String?
}

extension ItemEntityUser: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
       aliasName <- map["aliasName"]
       fullName <- map["fullName"]
       groupId <- map["groupId"]
       isChangePass <- map["isChangePass"]
       isLoginCardId <- map["isLoginCardId"]
       isSecrectaryVo1  <- map["isSecrectaryVo1"]
       listGroupIdLDVof1  <- map["listGroupIdLDVof1"]
       listGroupIdVTVof1  <- map["listGroupIdVTVof1"]
       listRoleIdVof1  <- map["listRoleIdVof1"]
       loginName <- map["loginName"]
       lstGroupAll <- map["lstGroupAll"]
       lstGroupOnlyLeader1  <- map["lstGroupOnlyLeader1"]
       mobileNumber <- map["mobileNumber"]
       strAddress <- map["strAddress"]
       strCANumber <- map["strCANumber"]
       strCASerial <- map["strCASerial"]
       strCardNumber <- map["strCardNumber"]
       strEmail <- map["strEmail"]
       strIdentification  <- map["strIdentification"]
       userId <- map["userId"]
    }
    
    
}



struct VhrOrg{
    enum IsActive{
        static let yes = 1
        static let no = 0
    }
    var isActive: IsActive?
    var name: String?
    var path: String?
    var sysOrganizationId: String?
}

extension VhrOrg: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        isActive <- map["isActive"]
        name <- map["name"]
        path <- map["path"]
        sysOrganizationId <- map["sysOrganizationId"]
    }
}

struct User{
    
}

extension User: Mappable {
    mutating func mapping(map: Map) {
        
    }
    
    init?(map: Map) {
        
    }
    
    
}
