//
//  ReviewViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 12/1/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct ReviewViewModel {
    let navigator: ReviewNavigatorType
    let useCase: ReviewUseCaseType
}

// MARK: - ViewModel
extension ReviewViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
