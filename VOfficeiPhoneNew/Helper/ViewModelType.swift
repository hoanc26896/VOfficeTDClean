//
//  ViewModelType.swift
//  Life
//
//  Created by Duc Minh Nguyen on 8/19/21.
//

import Foundation
import RxSwift
import RxCocoa

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}

public extension ObservableType {
    func mapToVoid() -> Observable<Void> { map { _ in () } }
    func asDriverOnErrorJustComplete() -> Driver<Element> { asDriver(onErrorDriveWith: .empty()) }
}

public extension ObservableType where Element == Bool {
    func filter() -> Observable<Element> { filter { $0 } }
    func not() -> Observable<Element> { map { !$0 } }
}

public extension SharedSequence {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> { map { _ in () } }
}

public extension SharedSequence where Element == Bool {
    func filter() -> SharedSequence { filter { $0 } }
    func not() -> SharedSequence { map { !$0 } }
}
