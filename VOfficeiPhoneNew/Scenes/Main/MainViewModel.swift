//
//  MainViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
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
        @Property var onLoadOutput: Driver<Void> = Driver.just(())
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        input.load.drive(output.$onLoadOutput).disposed(by: disposeBag)
        return output
    }
}
