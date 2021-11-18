//
//  GatewaysAssembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit

protocol GatewaysAssembler {
    func resolve() -> RSAGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {
    func resolve() -> RSAGatewayType {
        return RSAGateway()
    }
}
