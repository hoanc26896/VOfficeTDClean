//
//  Assembler.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

protocol Assembler: AnyObject,
                    MainAssembler,
                    LoginAssembler,
                    AppAssembler,
                    GatewaysAssembler,
                    ReviewAssembler
{
    
}

final class DefaultAssembler: Assembler {
    
}
