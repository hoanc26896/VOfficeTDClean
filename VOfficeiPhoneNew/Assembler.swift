//
//  Assembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

protocol Assembler: AnyObject,
                    MainAssembler,
                    AppAssembler,
                    GatewaysAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
