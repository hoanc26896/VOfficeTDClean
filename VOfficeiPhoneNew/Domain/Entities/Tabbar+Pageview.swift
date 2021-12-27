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
    
    var pageView: [PageViewEnum]? {
        switch self {
        case .review:
            return [PageViewEnum.reviewPage(.awaitingApproval),
                    PageViewEnum.reviewPage(.approved),
                    PageViewEnum.reviewPage(.rejected),
                    PageViewEnum.reviewPage(.promulgate),
                    PageViewEnum.reviewPage(.all)]
        case .sign:
            return [PageViewEnum.signPage(.awaitingApproval),
                    PageViewEnum.signPage(.awaitingInitial),
                    PageViewEnum.signPage(.approved),
                    PageViewEnum.signPage(.signInitial),
                    PageViewEnum.signPage(.rejected),
                    PageViewEnum.signPage(.rejectedInitial),
                    PageViewEnum.signPage(.rejectedApprovalEarlier),
                    PageViewEnum.signPage(.all)
            ]
        case .documentary:
            return [
                PageViewEnum.documentaryPage(.unprocessed),
                PageViewEnum.documentaryPage(.processed),
                PageViewEnum.documentaryPage(.unread),
                PageViewEnum.documentaryPage(.myDoc),
                PageViewEnum.documentaryPage(.all),
            ]
        case .calendar:
            return [
                PageViewEnum.documentaryPage(.unprocessed),
                PageViewEnum.documentaryPage(.processed),
                PageViewEnum.documentaryPage(.unread),
                PageViewEnum.documentaryPage(.myDoc),
                PageViewEnum.documentaryPage(.all),
            ]
        default:
            return [
                PageViewEnum.documentaryPage(.unprocessed),
                PageViewEnum.documentaryPage(.processed),
                PageViewEnum.documentaryPage(.unread),
                PageViewEnum.documentaryPage(.myDoc),
                PageViewEnum.documentaryPage(.all),
            ]
        }
    }
    
   
}

public enum PageViewEnum : Equatable{
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

enum PageModelStatus{
    case enable
    case disable
}

public struct PageModel {
    var index: Int
    var type: PageViewEnum
    var tilte: String
    var count: Int
    var viewController: BasePageItemViewController
    var status: PageModelStatus
    
    init(index: Int, type: PageViewEnum, title: String, count: Int, viewController: BasePageItemViewController, status: PageModelStatus = PageModelStatus.enable) {
        self.index = index
        self.type = type
        self.tilte = title
        self.count = count
        self.viewController = viewController
        self.status = status  
    }
}

