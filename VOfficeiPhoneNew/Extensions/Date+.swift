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
    
    func dateString() -> String {
        return DateFormatter.Format.date.instance.string(from: self)
    }
    
    static func date(day: Int, month: Int, year: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return DateFormatter.defaultCalendar.date(from: dateComponents)
    }
}


extension DateFormatter {
    static let defaultCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
    static let defaultLocale = Locale(identifier: "en_US_POSIX")
    static let japaneseLocale = Locale(identifier: "ja_JP")
    
    enum Format: String {
        case iso8601 = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        case date = "yyyy-MM-dd"
        
        var instance: DateFormatter {
            switch self {
            default:
                return DateFormatter().then {
                    $0.dateFormat = self.rawValue
                    $0.calendar = DateFormatter.defaultCalendar
                    $0.locale = DateFormatter.defaultLocale
                }
            }
        }
        
        var japaneseInstance: DateFormatter {
            switch self {
            default:
                return DateFormatter().then {
                    $0.dateFormat = self.rawValue
                    $0.calendar = DateFormatter.defaultCalendar
                    $0.locale = DateFormatter.japaneseLocale
                }
            }
        }
    }
}
