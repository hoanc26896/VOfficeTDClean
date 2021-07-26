//
//  MainViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

// MARK: - ViewModel
extension MainViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {

    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        return output
    }
}
