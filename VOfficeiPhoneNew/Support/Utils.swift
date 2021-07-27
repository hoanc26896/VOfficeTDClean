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
    return NSLocalizedString(key, comment: comment)
}
