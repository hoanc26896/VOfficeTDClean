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
    func getPage(pageViews: [PageViewEnum]) -> [PageModel]
    
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
        @Property var pages: [PageModel] = []
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        input.onLoad.map { _ -> [PageModel] in
            self.getPage(pageViews: tabbarItem.pageView ?? [])
        }.drive(output.$pages)
        .disposed(by: disposeBag)
  
        return output
    }
}

extension DocumentPageViewModel: DocumentPageViewModelProtocol{
    func getPage(pageViews: [PageViewEnum]) -> [PageModel] {
        var pages: [PageModel] = []
        for i in 0..<pageViews.count{
            let pageView = pageViews[i]
            var title = ""
            let vc = navigator.toDocument(pageView: pageView)
            vc.index = i
           
            switch pageView {
            case .reviewPage(let type):
                title = type.title
                break
            case .signPage(let type):
                title = type.title
                break
            case .documentaryPage(let type):
                title = type.title
                break
            default:
                break
            }
            
            let page = PageModel(index: i, type: pageView, title: title, count: 0,viewController: vc)
            pages.append(page)
        }
        return  pages
    }
}
