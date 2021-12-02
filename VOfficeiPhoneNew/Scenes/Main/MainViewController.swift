//
//  MainViewController.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/12/21.
//

import UIKit
import Reusable
import SDWebImage
import RxSwift
import RxCocoa
import MGArchitecture


final class MainViewController: BaseTabBarController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    var viewModel: MainViewModel!
    
  
    
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
        title = "Main"
       
    }
    
    func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid().take(1)
            .asDriverOnErrorJustComplete()
        let input = MainViewModel.Input(
            load: viewWillAppear
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.$rootViewControllers.asDriver().drive(rootViewControllersBinder).disposed(by: disposeBag)
    }
}

extension MainViewController{
    var rootViewControllersBinder: Binder<[UIViewController]> {
        return Binder(self) { vc, controllers in
            print("rootViewControllersBinder - controllers", controllers)
            vc.viewControllers = controllers
            vc.tabBar.tintColor = .red
        }
    }
}

