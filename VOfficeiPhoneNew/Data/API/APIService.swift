//
//  APIService.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import Foundation
import MGAPIService
import RxSwift

final class API: APIBase {
    static var shared = API()
    
    override func handleResponseError(response: HTTPURLResponse, data: Data, json: JSONDictionary?) -> Error {
        print("handleResponseError - response", response)
        print("handleResponseError - data", data)
        print("handleResponseError - json", json)
        if let json = json, let message = json["message"] as? String {
            return APIResponseError(statusCode: response.statusCode, message: message)
        }
        return super.handleResponseError(response: response, data: data, json: json)
    }
    
    override func preprocess(_ input: APIInputBase) -> Observable<APIInputBase> {
        return super.preprocess(input)
    }
}
