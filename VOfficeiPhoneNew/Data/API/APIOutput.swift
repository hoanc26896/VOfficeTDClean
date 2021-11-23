//
//  APIOutput.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import ObjectMapper
import MGAPIService

class APIOutput: APIOutputBase {  // swiftlint:disable:this final_class
    var message: String?
    var statusCode: Int?

  
    override func mapping(map: Map) {
        message <- map["result.mess.message"]
        statusCode <- map["result.mess.errorCode"]
    }
}
