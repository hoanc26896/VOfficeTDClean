//
//  AppViewModel.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import MGArchitecture
import RxSwift
import RxCocoa



struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

enum ViewControlerEnum {
    case main
}

// MARK: - ViewModel
extension AppViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
       
        input.load
            .drive(onNext: self.navigator.toMain)
            .disposed(by: disposeBag)
        
        return Output()
    }
}
