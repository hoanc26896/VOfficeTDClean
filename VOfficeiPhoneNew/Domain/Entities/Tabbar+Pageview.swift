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
    
    var pageView: [PageView]? {
        switch self {
        case .review:
            return [PageView.reviewPage(.awaitingApproval),
                    PageView.reviewPage(.approved),
                    PageView.reviewPage(.rejected),
                    PageView.reviewPage(.promulgate),
                    PageView.reviewPage(.all)]
        case .sign:
            return [PageView.signPage(.awaitingApproval),
                    PageView.signPage(.awaitingInitial),
                    PageView.signPage(.approved),
                    PageView.signPage(.signInitial),
                    PageView.signPage(.rejected),
                    PageView.signPage(.rejectedInitial),
                    PageView.signPage(.rejectedApprovalEarlier),
                    PageView.signPage(.all)
            ]
        case .documentary:
            return [
                PageView.documentaryPage(.unprocessed),
                PageView.documentaryPage(.processed),
                PageView.documentaryPage(.unread),
                PageView.documentaryPage(.myDoc),
                PageView.documentaryPage(.all),
            ]
        case .calendar:
            return [
                PageView.documentaryPage(.unprocessed),
                PageView.documentaryPage(.processed),
                PageView.documentaryPage(.unread),
                PageView.documentaryPage(.myDoc),
                PageView.documentaryPage(.all),
            ]
        default:
            return [
                PageView.documentaryPage(.unprocessed),
                PageView.documentaryPage(.processed),
                PageView.documentaryPage(.unread),
                PageView.documentaryPage(.myDoc),
                PageView.documentaryPage(.all),
            ]
        }
    }
    
   
}

public enum PageView : Equatable{
    case reviewPage(ReviewPageViewEnum)
    case signPage(SignPageViewEnum)
    case documentaryPage(DocumentPageViewEnum)
}

public enum ReviewPageViewEnum{
    case awaitingApproval // Chờ xét duyệt
    case approved // Đã xét duyệt
    case rejected // Đã từ chối
    case promulgate // Ban hành văn bản
    case all // Tất cả văn bản
    
    var title: String{
        switch self {
        case .awaitingApproval:
            return L10n.corePageReviewAwaitingApproval
        case .approved:
            return L10n.corePageReviewApproved
        case .rejected:
            return L10n.corePageReviewRejected
        case .promulgate:
            return L10n.corePageReviewPromulgateDocuments
        case .all:
            return L10n.corePageReviewAll
        default:
            return ""
        }
    }
    
    var backgroundColor: UIColor{
        switch self {
        case .awaitingApproval:
            return .red
        case .approved:
            return .blue
        case .rejected:
            return .brown
        case .promulgate:
            return .black
        default:
            return .white
        }
    }
}

public enum SignPageViewEnum{
    case awaitingApproval // Chờ ký duyệt
    case awaitingInitial // Chờ ký nháy
    case approved // Đã ký duyệt
    case signInitial // Đã ký nháy
    case rejected // Từ chối xét duyệt
    case rejectedInitial // Từ chối ký nháy
    case rejectedApprovalEarlier // Văn bản người ký sau từ chối
    case all // Tất cả văn bản
    
    var title: String{
        switch self {
        case .awaitingApproval:
            return L10n.corePageSignAwaitingApproval
        case .awaitingInitial:
            return L10n.corePageSignAwaitingInitial
        case .approved:
            return L10n.corePageSignApproved
        case .signInitial:
            return L10n.corePageSignSignInitial
        case .rejected:
            return L10n.corePageSignRejected
        case .rejectedInitial:
            return L10n.corePageSignInitialRejected
        case .rejectedApprovalEarlier:
            return L10n.corePageSignRejectedApprovedEarlier
        case .all:
            return L10n.corePageSignAll
        default:
            return ""
        }
    }
    
    var backgroundColor: UIColor{
        switch self {
        case .awaitingApproval:
            return .red
        case .awaitingInitial:
            return .blue
        case .approved:
            return .brown
        case .signInitial:
            return .black
        default:
            return .white
        }
    }
}

public enum DocumentPageViewEnum{
    case unprocessed // Chua xu ly
    case processed // Da xu ly
    case unread // Chua doc
    case myDoc // Toi tao
    case all // Tat ca cong van
    
    var title: String{
        switch self {
        case .unprocessed:
            return L10n.corePageDocumentsUnprocessed
        case .processed:
            return L10n.corePageDocumentsProcessed
        case .unread:
            return L10n.corePageDocumentsUnread
        case .myDoc:
            return L10n.corePageDocumentsMyDoc
        case .all:
            return L10n.corePageDocumentsAll
        default:
            return ""
        }
    }
    
    var backgroundColor: UIColor{
        switch self {
        case .unprocessed:
            return .red
        case .processed:
            return .blue
        case .unread:
            return .brown
        case .myDoc:
            return .black
        default:
            return .white
        }
    }
}

