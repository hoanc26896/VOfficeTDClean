//
//  String+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/24/21.
//

import Foundation
import CryptoKit

extension String {
    func base64EncodedSHA1Hash(using encoding: Encoding = .utf8) -> String? {
            guard let data = data(using: encoding) else { return nil }
            let hash = Data(Insecure.SHA1.hash(data: data))
            return hash.base64EncodedString()
        }
}
