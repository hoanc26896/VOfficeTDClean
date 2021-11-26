//
//  GatewaysAssembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit

protocol GatewaysAssembler {
    func resolve() -> LoginGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {
    func resolve() -> LoginGatewayType {
        return LoginGateway()
    }
}
