//
//  Document.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/27/21.
//

import Foundation
import Then
import ObjectMapper

enum YesNoEnum: Int{
    case no = 0
    case yes = 1
}

enum SignatureTypeEnum: Int{
    case review = 1 // Xet duyet
    case signInitial = 2 // Ky nhay
    case signReview = 3 // Ky duyet
}

enum MainStatusEnum:Int{
    case create = 0
    case processing = 1
    case reject = 2
    case approve = 3
    case promulgate = 4
    case waitSignInitial = 5
    case canThread = 6
    case resignedButNotResigned = 7
}

struct DocumentFile{
    var canRead: YesNoEnum = YesNoEnum.no
    var documentId: Int = 0
    var fileAttachmentId: String = ""
    var fileName: String = ""
    var filePath: String = ""
    var isCopy: YesNoEnum = YesNoEnum.no
    var storage: String = ""
}


struct Document{
    var canEdit: YesNoEnum = YesNoEnum.no
    var chiefName: String = ""
    var description: String = ""
    var isCommentFile: YesNoEnum = YesNoEnum.no
    var isProcessText: YesNoEnum = YesNoEnum.no
    var isTranferSignComment: YesNoEnum = YesNoEnum.no
    var listAttachTemplate: [DocumentFile] = []
    var listFileSignMain: [DocumentFile] = []
    var listFileSignOther:[DocumentFile] = []
    var mainStatus:MainStatusEnum = MainStatusEnum.create
    var numberHtime: String = ""
    var officeSender: String  = ""
    var officeSenderId: Int = 0
    var orderNumber: Int = 0
    var orderNumberMax: Int = 0
    var priorityName: String = ""
    var receiveDate: String = ""
    var rejectBefor: YesNoEnum = YesNoEnum.no
    var sTypeId: Int = 0
    var signatureType: SignatureTypeEnum = SignatureTypeEnum.review
    var textId: Int = 0
    var title: String = ""
    var typeName: String = ""
}

extension Document: Then, Equatable{
    static func == (lhs: Document, rhs: Document) -> Bool {
        lhs.textId == rhs.textId
    }
}

extension Document: Mappable{
    mutating func mapping(map: Map) {
        canEdit <- map["canEdit"]
        chiefName <- map["chiefName"]
        description <- map["description"]
        isCommentFile <- map["isCommentFile"]
        isProcessText <- map["isProcessText"]
        isTranferSignComment <- map["isTranferSignComment"]
        listAttachTemplate <- map["listAttachTemplate"]
        listFileSignMain <- map["listFileSignMain"]
        listFileSignOther <- map["listFileSignOther"]
        mainStatus <- map["mainStatus"]
        numberHtime <- map["numberHtime"]
        officeSender <- map["officeSender"]
        officeSenderId <- map["officeSenderId"]
        orderNumber <- map["orderNumber"]
        orderNumberMax <- map["orderNumberMax"]
        priorityName <- map["priorityName"]
        receiveDate <- map["receiveDate"]
        rejectBefor <- map["rejectBefor"]
        sTypeId <- map["sTypeId"]
        signatureType <- map["signatureType"]
        textId <- map["textId"]
        title <- map["title"]
        typeName <- map["typeName"]
    }
    
    init?(map: Map){
        self.init()
    }
    
    
}
