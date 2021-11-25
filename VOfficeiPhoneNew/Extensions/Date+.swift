//
//  Date+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/24/21.
//

import Foundation

extension Date{
    
    static func getDate()-> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: AppSettings.language)
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyyMMddHHmmss"

        let myString = formatter.string(from: Date()) // string purpose I add here
        return myString
    }
}
