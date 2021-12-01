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

enum ConfigMeetingRoom: Int {
    case isNotAdminSetup = 0
    case isAdminSetUp = 1
    
}

// Hiển thị tab duyệt người
enum AssiAproChange: Int{
    case isApprovePerson = 1
    case isNotApprovePerson = 0
}

enum LeafGroup: Int{
    case belongMinUnit = 1
    case notBelongMinUnit = 0
}

enum IsSecrectaryV02: Int{
    case yes = 1
    case no = 0
}

enum IsTranferAllDoc: Int{
    case yes = 1
    case no = 0
}

enum IsVip: Int{
    case yes = 1
    case no = 0
}

enum LoginBySSOEnum: String {
    case yes = "1"
    case no = "0"
}

enum IsActive: Int{
    case yes = 1
    case no = 0
}


enum isDefaultEnum: Int{
    case yes = 1
    case no = 0
}

enum isMeetingManagerEnum: Int{
    case yes = 1
    case no = 0
}

struct Vof2_ItemEntityUser {
    var adOrgId: Int?
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
    var listSecretaryVhrOrg: [Int]?
    var lstVhrOrgAll: [Int]?
    var lstVhrOrgNotSecretary: [Int]?
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
    var sysOrgId: Int?
    var sysOrgName: String?
    var sysRoleId: Int?
    var timeZone: String?
    var typeNotSend: Int?
    var urlService: String?
    var userId: Int?
    var userIdVof1: Int?
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
    var groupId: Int?
    var isChangePass: String?
    var isLoginCardId: String?
    var isSecrectaryVo1: IsSecrectaryV02?
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
    var userId: Int?
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
    
    var isActive: IsActive?
    var name: String?
    var path: String?
    var sysOrganizationId: Int?
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

struct ApproveCalDept {
    
    var deptId: Int?
    var deptName: String?
    var isDefault: isDefaultEnum?
}

extension ApproveCalDept: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        deptId <- map["deptId"]
        deptName <- map["deptName"]
        isDefault <- map["isDefault"]
    }
}

struct Manager{
    var employeeId: Int?
    var fullName: String?
}

extension Manager: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        employeeId <- map["employeeId"]
        fullName <- map["fullName"]
    }
    
    
}

struct Director{
    var email: String?
    var employeeCode: String?
    var employeeId: Int?
    var fullName: String?
    var position: String?
    
}

extension Director: Mappable{
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        email <- map["email"]
        employeeCode <- map["employeeCode"]
        employeeId <- map["employeeId"]
        fullName <- map["fullName"]
        position <- map["position"]
    }
    
    
}

struct User{
    var listApproveCalDept: [ApproveCalDept]?
    var listPoliticalAssistantOrg: [VhrOrg]?
    var listManagementVhrOrgIsDefault: [VhrOrg]?
    var listManagementVhrOrg: [VhrOrg]?
    var sysOrgName: String?
    var userLanguage: String?
    var manager:Manager?
    var sysRoleId: Int?
    var pathDepart2: String?
    var orgPath: String?
    var lstVhrOrgAll: [Int]?
    var tgd: Director?
    var isAssiAproChange:AssiAproChange?
    var strEmail: String?
    var listSecretaryVhrOrg: [Int]?
    var aliasName: String?
    var listOrgPath: [String]?
    var roleCode: Int?
    var isDeault:isDefaultEnum?
    var isLeafGroup: LeafGroup?
    var isTranferAllDoc: IsTranferAllDoc?
    var listOrgPersonReport: [String]?
    var sendTypeNotSend: Int?
    var hmRole: [String: String]?
    var strIdentification: String?
    var typeNotSend: Int?
    var isVip: IsVip?
    var configMeetingRoom: ConfigMeetingRoom?
    var strCardNumber: String?
    var strAddress: String?
    var strDateOfBirth: String?
    var lstVhrOrgNotSecretary: [Int]?
    var listSecretaryOrg: [VhrOrg]?
    var fullName: String?
    var adOrgName: String?
    var userIdVof1: Int?
    var languageCode: String?
    var lstVhrOrgIsDefault: [Int]?
    var userId: Int?
    var isMeetingManager:isMeetingManagerEnum?
    var sendFailReason: Int?
    var place: String?
    var sysOrgId: Int?
    var isSecrectaryVo2: IsSecrectaryV02?
    var jobTile: String?
    var listAssistantVhrOrg: [VhrOrg]?
    var urlService: String?
}

extension User: Mappable {
    mutating func mapping(map: Map) {
        listApproveCalDept <- map["listApproveCalDept"]
        listPoliticalAssistantOrg <- map["listPoliticalAssistantOrg"]
        listManagementVhrOrgIsDefault <- map["listManagementVhrOrgIsDefault"]
        listManagementVhrOrg <- map["listManagementVhrOrg"]
        sysOrgName  <- map["sysOrgName"]
        userLanguage <- map["userLanguage"]
        manager <- map["manager"]
        sysRoleId <- map["sysRoleId"]
        pathDepart2 <- map["pathDepart2"]
        orgPath <- map["orgPath"]
        lstVhrOrgAll <- map["lstVhrOrgAll"]
        tgd  <- map["tgd"]
        isAssiAproChange <- map["isAssiAproChange"]
        strEmail <- map["strEmail"]
        listSecretaryVhrOrg <- map["listSecretaryVhrOrg"]
        aliasName <- map["aliasName"]
        listOrgPath <- map["listOrgPath"]
        roleCode <- map["roleCode"]
        isDeault <- map["isDeault"]
        isLeafGroup <- map["isLeafGroup"]
        isTranferAllDoc <- map["isTranferAllDoc"]
        listOrgPersonReport <- map["listOrgPersonReport"]
        sendTypeNotSend <- map["sendTypeNotSend"]
        hmRole <- map["hmRole"]
        strIdentification <- map["strIdentification"]
        typeNotSend <- map["typeNotSend"]
        isVip <- map["isVip"]
        configMeetingRoom <- map["configMeetingRoom"]
        strCardNumber <- map["strCardNumber"]
        strAddress <- map["strCardNumber"]
        strDateOfBirth <- map["strDateOfBirth"]
        lstVhrOrgNotSecretary <- map["lstVhrOrgNotSecretary"]
        listSecretaryOrg <- map["listSecretaryOrg"]
        fullName <- map["fullName"]
        adOrgName <- map["adOrgName"]
        userIdVof1 <- map["userIdVof1"]
        languageCode <- map["languageCode"]
        lstVhrOrgIsDefault <- map["lstVhrOrgIsDefault"]
        userId <- map["userId"]
        isMeetingManager <- map["isMeetingManager"]
        sendFailReason <- map["sendFailReason"]
        place <- map["place"]
        sysOrgId <- map["sysOrgId"]
        isSecrectaryVo2 <- map["isSecrectaryVo2"]
        jobTile <- map["jobTile"]
        listAssistantVhrOrg <- map["listAssistantVhrOrg"]
        urlService <- map["urlService"]
    }
    
    init?(map: Map) {
        
    }
}
