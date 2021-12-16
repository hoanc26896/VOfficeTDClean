//
//  String+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/24/21.
//

import Foundation
import CryptoKit
import UIKit

extension String {
    func base64EncodedSHA1Hash(using encoding: Encoding = .utf8) -> String? {
        guard let data = data(using: encoding) else { return nil }
        let hash = Data(Insecure.SHA1.hash(data: data))
        return hash.base64EncodedString()
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
