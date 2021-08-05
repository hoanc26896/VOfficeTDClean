//
//  AppSettings.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 1/14/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

import UIKit

struct AppSettingKeys {
    static let i18n = "AppleLanguages"
    static let biometric = "biometric"
}

enum AppSettings {
    
    @Storage(key: "didInit", defaultValue: false)
    static var didInit: Bool // swiftlint:disable:this let_var_whitespace
    
    @Storage(key: AppSettingKeys.i18n, defaultValue: "vi")
    static var language: String
}
