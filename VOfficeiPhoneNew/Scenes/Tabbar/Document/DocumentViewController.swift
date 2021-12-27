//
//  DocumentViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class DocumentViewController: BasePageItemViewController, Bindable {
    
    
    // MARK: - Properties
    
    var viewModel: DocumentViewModel!
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
        let input = DocumentViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension DocumentViewController {
    
}
