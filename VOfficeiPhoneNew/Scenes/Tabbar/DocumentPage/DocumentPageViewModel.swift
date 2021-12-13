//
//  DocumentPageViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

protocol DocumentPageViewModelProtocol{
    func getPage(pageViews: [PageView]) -> ([DocumentViewController], [SegmentControlItem])
    
}

struct DocumentPageViewModel {
    let navigator: DocumentPageNavigatorType
    let useCase: DocumentPageUseCaseType
    let tabbarItem: TabBarItem
}

// MARK: - ViewModel
extension DocumentPageViewModel: ViewModel {
    struct Input {
        var onLoad: Driver<Void>
    }
    
    struct Output {
        @Property var pages: ([DocumentViewController], [SegmentControlItem]) = ([], [])
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        input.onLoad.map { _ -> ([DocumentViewController], [SegmentControlItem]) in
            self.getPage(pageViews: tabbarItem.pageView ?? [])
        }.drive(output.$pages)
        .disposed(by: disposeBag)
  
        return output
    }
}

extension DocumentPageViewModel: DocumentPageViewModelProtocol{
    func getPage(pageViews: [PageView]) -> ([DocumentViewController], [SegmentControlItem]) {
        var vcs: [DocumentViewController] = []
        var sms: [SegmentControlItem] = []
        for i in 0..<pageViews.count{
            let pageView = pageViews[i]
            let vc = navigator.toDocument(pageView: pageView)
            switch pageView {
            case .reviewPage(let type):
                switch type {
                case .awaitingApproval:
                    vc.view.backgroundColor = .red
                case .approved:
                    vc.view.backgroundColor = .blue
                case .rejected:
                    vc.view.backgroundColor = .brown
                case .promulgate:
                    vc.view.backgroundColor = .gray
                case .all:
                    vc.view.backgroundColor = .green
                default:
                    vc.view.backgroundColor = .white
                }
               
                break
            case .signPage(let type):
                vc.view.backgroundColor = .red
                break
            case .documentaryPage(let type):
                vc.view.backgroundColor = .red
                break
            default:
                break
            }
            
            vcs.append(vc)
            
            let sm = SegmentControlItem()
            switch pageView {
            case .reviewPage(let type):
                sm.segmentItemButton.setTitle(type.title, for: .normal)
                break
            case .signPage(let type):
                sm.segmentItemButton.setTitle(type.title, for: .normal)
                break
            case .documentaryPage(let type):
                sm.segmentItemButton.setTitle(type.title, for: .normal)
                break
            default:
                break
            }
            sm.segmentItemButton.setTitleColor( LAsset.header.color, for: .normal)
            sms.append(sm)
        }
        return (vcs, sms)
    }
    
    
}
