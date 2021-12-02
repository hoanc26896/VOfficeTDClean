//
//  DocumentViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/2/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct DocumentViewModel {
    let navigator: DocumentNavigatorType
    let useCase: DocumentUseCaseType
}

// MARK: - ViewModel
extension DocumentViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
