//
//  AppDelegate.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 7/26/21.
//

import RxCocoa
import RxSwift
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    var disposeBag = DisposeBag()
    
    static let AppDelegateShared = AppDelegate()    

    func applicationDidFinishLaunching(_ application: UIApplication) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        if NSClassFromString("XCTest") != nil { // test
            window.rootViewController = UnitTestViewController()
            window.makeKeyAndVisible()
        } else {
            bindViewModel(window: window)
        }
    }

    private func bindViewModel(window: UIWindow) {
        let vm: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(load: Driver.just(()))
        let output = vm.transform(input, disposeBag: disposeBag)
    }
    
   
}
