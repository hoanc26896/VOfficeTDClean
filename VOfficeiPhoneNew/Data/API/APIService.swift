//
//  APIService.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import Foundation
import MGAPIService
import RxSwift
import Alamofire

final class API: APIBase {
    static var shared = API()
    
    public override init(configuration: URLSessionConfiguration) {
        super.init(configuration: configuration)
        logOptions = LogOptions.all
    }
    
    override func handleResponseError(response: HTTPURLResponse, data: Data, json: JSONDictionary?) -> Error {
     
        if let result = json?["result"] as? [String: Any], let mess = result["mess"] as? [String: Any],
           let errorCode = mess["errorCode"] as? Int, let message = mess["message"] as? String {
            return APIResponseError(errorCode: errorCode, message: message)
        }
        return super.handleResponseError(response: response, data: data, json: json)
    }
    
    override func preprocess(_ input: APIInputBase) -> Observable<APIInputBase> {
        return super.preprocess(input)
    }
    
    override func process<U>(_ response: (HTTPURLResponse, Data)) throws -> APIResponse<U> where U : JSONData {
        print(response)
        let (urlResponse, data) = response
        let json: U? = (try? JSONSerialization.jsonObject(with: data, options: [])) as? U
   
        let error: Error
        let statusCode = urlResponse.statusCode
        
        switch statusCode {
        case 200..<300:
            if logOptions.contains(.responseStatus) {
                print("👍 [\(statusCode)] " + (urlResponse.url?.absoluteString ?? ""))
            }
            
            if logOptions.contains(.urlResponse) {
                print(urlResponse)
            }
            
            if logOptions.contains(.responseData) {
                print("[RESPONSE DATA]")
                print(json ?? data)
            }
            
            // swiftlint:disable:next explicit_init
            return APIResponse(header: urlResponse.allHeaderFields, data: json ?? U.init())
        default:
            error = handleResponseError(response: urlResponse, data: data, json: json)
            
            if logOptions.contains(.responseStatus) {
                print("❌ [\(statusCode)] " + (urlResponse.url?.absoluteString ?? ""))
            }
            
            if logOptions.contains(.urlResponse) {
                print(urlResponse)
            }
            
            if logOptions.contains(.error) || logOptions.contains(.responseData) {
                print("[RESPONSE DATA]")
                print(json ?? data)
            }
        }
        throw error

    }
}
