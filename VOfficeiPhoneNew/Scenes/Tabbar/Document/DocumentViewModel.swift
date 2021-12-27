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
    let type: PageViewEnum
}

// MARK: - ViewModel
extension DocumentViewModel: ViewModel {
    struct Input {
//        let load: Driver<Void>
//        let reload: Driver<Void>
//        let loadMore: Driver<Void>
    }
    
    struct Output {
        @Property var error: Error?
        @Property var isLoading = false
        @Property var isReloading = false
        @Property var isLoadingMore = false
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
