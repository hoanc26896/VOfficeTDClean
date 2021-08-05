//
//  Utils.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 6/21/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

import UIKit

func after(interval: TimeInterval, completion: (() -> Void)?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        completion?()
    }
}

func localize(key: String, comment: String) -> String {
    let appLang = AppSettings.language
    let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
    let bundle = Bundle(path: path!)
    return NSLocalizedString(key, tableName: nil, bundle: bundle!, value: "", comment: comment)
}
