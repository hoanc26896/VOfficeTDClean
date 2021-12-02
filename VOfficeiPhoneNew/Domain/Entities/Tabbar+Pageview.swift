//
//  Tabbar+Pageview.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import Foundation
import UIKit

public enum TabBarItem{
    case review
    case sign
    case documentary
    case calendar
    case more
    
    var title: String{
        switch self {
        case .review:
            return L10n.coreTabbarApproveDocs
        case .sign:
            return L10n.coreTabbarSign
        case .documentary:
            return L10n.coreTabbarDocuments
        case .calendar:
            return L10n.coreTabbarCalendar
        case .more:
            return L10n.coreTabbarMore
        default:
            return ""
        }
    }
    
    var icon: UIImage?{
        switch self {
        case .review:
            return LAsset.menuSign
        case .sign:
            return LAsset.menuSign
        case .documentary:
            return LAsset.menuDocument
        case .calendar:
            return LAsset.menuCalendar
        case .more:
            return LAsset.menuMore
        default:
            return LAsset.lgUserIc
        }
    }
    
    var selectedIcon: UIImage?{
        switch self {
        case .review:
            return LAsset.menuSign
        case .sign:
            return LAsset.menuSign
        case .documentary:
            return LAsset.menuDocument
        case .calendar:
            return LAsset.menuCalendar
        case .more:
            return LAsset.menuMore
        default:
            return LAsset.lgUserIc
        }
    }
}

