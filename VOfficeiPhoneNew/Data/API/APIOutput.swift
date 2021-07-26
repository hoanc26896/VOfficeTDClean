//
//  APIOutput.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import ObjectMapper
import MGAPIService

class APIOutput: APIOutputBase {  // swiftlint:disable:this final_class
    var message: String?
    
    override func mapping(map: Map) {
        message <- map["message"]
    }
}
