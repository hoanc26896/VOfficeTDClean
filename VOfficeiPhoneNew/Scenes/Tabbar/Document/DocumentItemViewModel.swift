//
//  DocumentItemViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/27/21.
//

import Foundation

struct DocumentItemViewModel{
    let title: String
    let timeWarningTitle: String
    let timeWarning: String
    let timeSubmit: String
    
    init(document: DocumentModel) {
        self.title = "\(document.no) \(document.document.title)"
        self.timeWarningTitle = "Thoi gian trinh"
        self.timeWarning = "áđâsd"
        self.timeSubmit = "xzczxcxzcxzc"
    }
}
