//
//  AppSettings.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/17/21.
//

import UIKit
#if DEBUG
let baseUrl = "http://10.60.108.86:8599"
#elseif BETA
let baseUrl = "http://10.60.108.86:8599"
#else
let baseUrl = "http://10.60.108.86:8599"
#endif

enum AppSettings {
    
    @Storage(key: "didInit", defaultValue: false)
    static var didInit: Bool // swiftlint:disable:this let_var_whitespace
    
    @Storage(key: "language", defaultValue: "vi")
    static var language: String // swiftlint:disable:this let_var_whitespace
    
    @Storage(key: "baseUrl", defaultValue: baseUrl)
    static var baseUrl: String
}
