//
//  Assembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

protocol Assembler: AnyObject,
                    MainAssembler,
                    AppAssembler,
                    GatewaysAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
