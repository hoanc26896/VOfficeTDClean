//
//  DocumentPageViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/13/21.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then
import SnapKit

final class DocumentPageViewController: BasePageViewController, Bindable {
    
    // MARK: - Properties
    
    var viewModel: DocumentPageViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        
    }
    
    func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid().take(1)
            .asDriverOnErrorJustComplete()
        
        let input = DocumentPageViewModel.Input(
            onLoad: viewWillAppear
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.$pages.asDriver().drive(pagesBinder).disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension DocumentPageViewController {
    var pagesBinder: Binder<([DocumentViewController], [SegmentControlItem])>{
        return Binder(self){ vc, result in
            let pageVCs = result.0
            let segmentControlItems = result.1
            if pageVCs.count > 0 {
                print("pagesBinder - pages", pageVCs)
                vc.setPages(pages: pageVCs)
            }
            if (segmentControlItems.count > 0){
                vc.setSegments(segmentControlItems: segmentControlItems)
            }
            
        }
    }
}
