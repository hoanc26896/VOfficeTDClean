//
//  DocumentModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/27/21.
//

import Foundation

struct DocumentModel {
    let no: Int
    let document: Document
    let edited: Bool
}

extension DocumentModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(document.textId)
    }
    
    static func == (lhs: DocumentModel, rhs: DocumentModel) -> Bool {
        return lhs.document.textId == rhs.document.textId
    }
}

extension DocumentModel {
    init(document: Document, no: Int) {
        self.init(no: no, document: document, edited: false)
    }
}
