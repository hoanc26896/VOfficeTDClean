//
//  APIParams.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/24/21.
//

import Foundation

public class CommonParams: NSObject{
    var deviceName:String = ""
    var tempTime: String = ""
    var transactionTime: String = ""
    
    
    override init() {
        self.deviceName = "VOffice-iPhone 2.5.2 - Simulator - 15.0"
        self.tempTime = Date.getDate()
        self.transactionTime = "\(Date().timeIntervalSince1970 * 1000)"
    }
}
