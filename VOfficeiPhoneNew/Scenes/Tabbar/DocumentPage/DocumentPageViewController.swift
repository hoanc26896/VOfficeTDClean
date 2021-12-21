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
    var pagesBinder: Binder<([PageModel])>{
        return Binder(self){ vc, pages in
            if !pages.isEmpty{
                vc.pages = pages
            }
            
        }
    }
}
